import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              'Welcome to Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Add a cart for Analytics",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Crush for Test Crashlytics",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () => context.go(AppRoutes.splash),
              child: Text(
                'Go to Splash Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
