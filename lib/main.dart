import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qalam_app/firebase_options.dart';
import 'package:qalam_app/presentation/dashboard/dashboard_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('🔙 [Background] Message: ${message.notification?.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // makes status bar transparent
      statusBarIconBrightness:
          Brightness.light, // use Brightness.light for white icons
      statusBarBrightness: Brightness.dark, // for iOS
    ),
  );
  runApp(const MyApp());
}

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

  // Initialize Firebase Messaging and request permissions
  Future<void> _initFirebaseMessaging() async {
    await _subscribeToTopic();
    await _requestNotificationPermissions();

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 [Foreground] ${message.notification?.title}');
    });

    // When the app is opened from a background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📲 [Opened App] ${message.notification?.title}');
    });
  }

  // Subscribe to the topic 'general'
  Future<void> _subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('general');
    print('Subscribed to topic: general');
  }

  // Request notification permissions for iOS
  Future<void> _requestNotificationPermissions() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('🔐 Permission: ${settings.authorizationStatus}');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DashboardScreen(),
          );
        });
  }
}
