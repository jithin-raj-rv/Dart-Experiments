import 'package:ai_personal_task_manager/view%20model/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final user = ref.watch(authViewModelProvider.notifier).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authViewModel.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text('Welcome, ${user?.email}'),
      ),
    );
  }
}

