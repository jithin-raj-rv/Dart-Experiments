import 'package:ai_personal_task_manager/app_colors.dart';
import 'package:ai_personal_task_manager/view/auth_view.dart';
import 'package:ai_personal_task_manager/view/home_view.dart';
import 'package:ai_personal_task_manager/view/splash_view.dart';
import 'package:ai_personal_task_manager/view%20model/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://sdemxhozcrnaztkcqsct.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkZW14aG96Y3JuYXp0a2Nxc2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU0NDEyNTgsImV4cCI6MjA4MTAxNzI1OH0.xlXjChopD4OU4LsEkhR6I49j8uQuObg2Hut-wMbBr7w',
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return MaterialApp(
      title: 'AI Personal Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDarkBlue,
          primary: AppColors.primaryDarkBlue,
          secondary: AppColors.accentColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: authState.when(
        data: (state) {
          if (state != null) {
            return const HomePage();
          } else {
            return const AuthView();
          }
        },
        loading: () => const SplashPage(),
        error: (e, st) => const AuthView(),
      ),
    );
  }
}