// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/domain/entites/auth_entity.dart';
import 'package:paycron_app/src/presentation/features/authentication/notifiers/signin_notifier.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field_with_title.dart';

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});

  final emailCtrl = TextEditingController(text: "user@gmail.com");
  final passCtrl = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signinState = ref.watch(loginNotifierProvider);
    ref.listen<AsyncValue<SigninEntity?>>(loginNotifierProvider, (prev, next) {
      next.when(
        data: (success) {
          if (success != null) {
            context.go(AppRoutes.home);
          }
        },
        loading: () {},
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan.withOpacity(0.1),
        elevation: 4.0,
        centerTitle: true,
        // Adding a subtle shadow and a custom style for the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  CommonTextfieldWithTitle("Email", emailCtrl),
                  CommonTextfieldWithTitle("Password", passCtrl),
                  const SizedBox(height: 20),

                  CommonButton(
                    "Login",
                    isLoading: signinState.isLoading,
                    onTap: () {
                      ref
                          .read(loginNotifierProvider.notifier)
                          .login(
                            email: emailCtrl.text.trim(),
                            password: passCtrl.text.trim(),
                          );
                    },
                  ),

                  InkWell(
                    onTap: () {
                      context.go(AppRoutes.createAccountScreen);
                    },
                    child: Text("Go to Signup"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
