import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/commons/data/service/remote_config_service.dart';
import 'package:qalam_app/core/utils/shared_preference.dart';
import 'package:qalam_app/feature/common/cubit/sociallinks_cubit.dart';
import 'package:qalam_app/feature/dashboard/cubit/bottom_navbar_cubit.dart';
import 'package:qalam_app/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:qalam_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:qalam_app/feature/onboarding_into/presentation/onboarding_into_screen.dart';
import 'package:qalam_app/firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

/// Global instance for local notifications
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Background message handler for Firebase Cloud Messaging
/// This function is called when the app receives a message while in background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('🔙 [Background] Message: ${message.notification?.title}');
}

/// Global service locator instance
final getIt = GetIt.instance;

/// Global Firestore instance
final firestore = FirebaseFirestore.instance;

/// Application entry point
/// Initializes Firebase, configures system UI, and sets up dependencies
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize timezone data for notifications
  tz.initializeTimeZones();
  
  // Initialize shared preferences
  await SharedPrefsHelper().init();
  
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Configure system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  
  // Initialize Remote Config
  final service = RemoteConfigService(FirebaseRemoteConfig.instance);
  final repo = RemoteConfigRepository(service);
  await repo.initializeRemoteConfig();
  getIt.registerSingleton<RemoteConfigRepository>(repo);
  
  // Start the app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardCubit()),
        BlocProvider(create: (_) => SocialLinksCubit()..loadSocialLinks()),
      ],
      child: const MyApp(),
    ),
  );
}

/// Root widget of the Qalam Academy application
/// Handles app initialization, theming, and navigation
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initFirebaseMessaging();
  }

  /// Initialize Firebase Messaging with proper error handling
  Future<void> _initFirebaseMessaging() async {
    try {
      await _requestNotificationPermissions();
      await _initializeLocalNotifications();
      _setupMessageHandlers();
      
      // Handle platform-specific setup
      if (Platform.isIOS) {
        _handleIOSSpecificSetup();
      } else {
        _handleAndroidSpecificSetup();
      }
      
      print('✅ Firebase Messaging initialization completed');
    } catch (e) {
      print('❌ Error initializing Firebase Messaging: $e');
    }
  }

  /// Request notification permissions from the user
  Future<void> _requestNotificationPermissions() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      criticalAlert: false,
      announcement: false,
    );

    _logPermissionStatus(settings.authorizationStatus);
  }

  /// Initialize local notifications for both platforms
  Future<void> _initializeLocalNotifications() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      ),
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Set up Firebase message handlers
  void _setupMessageHandlers() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Handle app opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  /// Handle iOS-specific setup (APNS token management)
  void _handleIOSSpecificSetup() {
    // Run APNS token setup in background to not block app startup
    _waitForAPNSTokenAndSubscribe();
  }

  /// Handle Android-specific optimizations
  void _handleAndroidSpecificSetup() async {
    print('🤖 Setting up Android push notifications...');
    
    // Android can get FCM token immediately
    await _subscribeToGeneralTopic();
    
    // Set up Android-specific notification channel
    await _createAndroidNotificationChannel();
  }

  /// Create Android notification channel for better notification management
  Future<void> _createAndroidNotificationChannel() async {
    if (Platform.isAndroid) {
      const androidChannel = AndroidNotificationChannel(
        'general_channel',
        'General Notifications',
        description: 'General notifications from Qalam Academy',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
        showBadge: true,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);
      
      print('✅ Android notification channel created');
    }
  }

  /// Wait for APNS token on iOS and subscribe to topics
  Future<void> _waitForAPNSTokenAndSubscribe() async {
    print('📱 Setting up iOS push notifications...');
    
    try {
      String? apnsToken = await _waitForAPNSToken();
      
      if (apnsToken != null) {
        print('✅ APNS Token available, proceeding with FCM setup');
        await _subscribeToGeneralTopic();
      } else {
        _handleMissingAPNSToken();
      }
    } catch (e) {
      print('❌ Error in iOS setup: $e');
    }
  }

  /// Wait for APNS token with retry logic
  Future<String?> _waitForAPNSToken() async {
    const maxAttempts = 5;
    const delayBetweenAttempts = Duration(milliseconds: 500);
    
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      
      if (apnsToken != null) {
        print('✅ APNS Token received: ${apnsToken.substring(0, 20)}...');
        return apnsToken;
      }
      
      print('⏳ Waiting for APNS token... Attempt $attempt/$maxAttempts');
      if (attempt < maxAttempts) {
        await Future.delayed(delayBetweenAttempts);
      }
    }
    
    return null;
  }

  /// Subscribe to general topic for notifications
  Future<void> _subscribeToGeneralTopic() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('🎯 FCM Token: ${fcmToken ?? "null"}');

      if (fcmToken != null) {
        await FirebaseMessaging.instance.subscribeToTopic('general');
        print('✅ Subscribed to topic: general');
      } else {
        _handleNullFCMToken();
      }
    } catch (e) {
      _handleSubscriptionError(e);
    }
  }

  /// Handle foreground message notifications
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('� [Foreground] ${message.notification?.title}');
    
    final notification = message.notification;
    if (notification?.title != null && notification?.body != null) {
      await _showLocalNotification(notification!);
    }
  }

  /// Show local notification
  Future<void> _showLocalNotification(RemoteNotification notification) async {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'general_channel',
          'General Notifications',
          channelDescription: 'General notifications from Qalam Academy',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          playSound: true,
          enableVibration: true,
          showWhen: true,
          when: DateTime.now().millisecondsSinceEpoch,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  /// Handle notification tap when app is opened
  void _handleNotificationTap(RemoteMessage message) {
    print('� [Opened App] ${message.notification?.title}');
    // Add navigation logic here if needed
  }

  /// Handle missing APNS token (usually on simulator)
  void _handleMissingAPNSToken() {
    print('⚠️ APNS Token not available');
    print('💡 Running on iOS simulator - push notifications unavailable');
    print('📱 Use a physical device to test push notifications');
  }

  /// Handle null FCM token
  void _handleNullFCMToken() {
    print('⚠️ FCM Token is null, cannot subscribe to topic');
    if (Platform.isIOS) {
      print('💡 This is expected on iOS simulator');
    }
  }

  /// Handle subscription errors
  void _handleSubscriptionError(dynamic error) {
    print('❌ Error subscribing to topic: $error');
    
    if (error.toString().contains('apns-token-not-set')) {
      print('💡 APNS token error - normal on iOS simulator');
      print('📱 Use a physical iOS device for push notifications');
    }
  }

  /// Log permission status with appropriate emoji
  void _logPermissionStatus(AuthorizationStatus status) {
    print('🔐 Permission Status: $status');
    
    switch (status) {
      case AuthorizationStatus.authorized:
        print('✅ User granted permission');
        break;
      case AuthorizationStatus.provisional:
        print('⚠️ User granted provisional permission');
        break;
      default:
        print('❌ User declined or has not accepted permission');
    }
  }

  /// Check if onboarding should be shown to the user
  Future<bool> _shouldShowOnboarding() async {
    return !SharedPrefsHelper().getOnboardingSeen();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: _shouldShowOnboarding(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              
              return snapshot.data!
                  ? const OnBoardingIntoScreen()
                  : BlocProvider(
                      create: (context) => DashboardCubit(),
                      child: DashboardScreen(
                        dashboardCubit: DashboardCubit(),
                        bottomNavbarCubit: BottomNavbarCubit(),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
