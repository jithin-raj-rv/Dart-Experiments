import 'package:flutter/material.dart';
import 'noti_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification service
  final notificationService = NotificationService();
  await notificationService.init();
  
  // Request notification permissions on startup
  await notificationService.requestNotificationPermission();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Notification Demo App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('🔔 Testing instant notification...');
                _notificationService.showNotification(
                  id: 1,
                  title: 'Instant Test',
                  body: 'This is an instant test notification!',
                );
              },
              child: const Text('Test Instant Notification'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _notificationService.scheduleNotification(
                  id: 2,
                  title: 'Scheduled Notification',
                  body: 'This notification will appear in 5 seconds!',
                  duration: const Duration(seconds: 5),
                );
              },
              child: const Text('Schedule Notification (5s)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _notificationService.scheduleNotification(
                  id: 3,
                  title: 'Daily Reminder',
                  body: 'Don\'t forget to check your app today!',
                  duration: const Duration(minutes: 1),
                );
              },
              child: const Text('Schedule Reminder (1 min)'),
            ),
          ],
        ),
      ),
    );
  }
}
