import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qalam_app/core/utils/shared_preference.dart';
import 'package:qalam_app/feature/dashboard/dashboard_screen.dart';
import 'package:qalam_app/feature/onboarding_into/presentation/onboarding_into_screen.dart';
import 'package:qalam_app/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('🔙 [Background] Message: ${message.notification?.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
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

  Future<void> _subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('general');
    print('Subscribed to topic: general');
  }

  Future<void> _requestNotificationPermissions() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('🔐 Permission: ${settings.authorizationStatus}');
  }

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
                    : const DashboardScreen();
              },
            ),
          );
        });
  }
}
