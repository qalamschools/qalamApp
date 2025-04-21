import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:qalam_app/firebase_options.dart';
import 'package:qalam_app/presentation/dashboard/dashboard_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('🔙 [Background] Message: ${message.notification?.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _fcmToken;
  String? _lastMessage;
  @override
  void initState() {
    _initFirebaseMessaging();
    super.initState();
  }

  Future<void> _initFirebaseMessaging() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permission
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('🔐 Permission: ${settings.authorizationStatus}');

    // Get token
    String? token = await FirebaseMessaging.instance.getToken();
    print('📱 FCM Token: $token');

    setState(() {
      _fcmToken = token;
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 [Foreground] ${message.notification?.title}');
      setState(() {
        _lastMessage = '[Foreground] ${message.notification?.title}';
      });
    });

    // When app is opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📲 [Opened App] ${message.notification?.title}');
      setState(() {
        _lastMessage = '[Opened App] ${message.notification?.title}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: DashboardScreen(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Push Notifications')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('📱 Device FCM Token:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SelectableText(_fcmToken ?? 'Fetching...',
                  style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 24),
              const Text('📨 Last Received Message:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(_lastMessage ?? 'No messages yet.'),
            ],
          ),
        ),
      ),
    );
  }
}
