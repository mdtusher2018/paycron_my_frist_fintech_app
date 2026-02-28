// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:template/src/presentation/router/routes.dart';
import 'package:template/src/domain/entites/signin_entity.dart';
import 'package:template/src/presentation/features/authentication/notifiers/signin_notifier.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text_field_with_title.dart';

// Define a class to hold both the Rive animation state and the controller
class RiveState {
  final bool lookingDown;
  final bool handsUp;
  final double lookLeftRight;
  final StateMachineController? controller;

  RiveState({
    required this.lookingDown,
    required this.handsUp,
    required this.lookLeftRight,
    this.controller,
  });

  RiveState copyWith({
    bool? lookingDown,
    bool? handsUp,
    double? lookLeftRight,
    StateMachineController? controller,
  }) {
    return RiveState(
      lookingDown: lookingDown ?? this.lookingDown,
      handsUp: handsUp ?? this.handsUp,
      lookLeftRight: lookLeftRight ?? this.lookLeftRight,
      controller: controller ?? this.controller,
    );
  }
}

// Define a StateNotifier to manage both the animation state and the Rive controller
class RiveAnimationNotifier extends StateNotifier<RiveState> {
  RiveAnimationNotifier()
    : super(RiveState(lookingDown: false, handsUp: false, lookLeftRight: 0.0));

  // Setters for the animation state and controller
  void setLookingDown(bool value) {
    state = state.copyWith(lookingDown: value);
    state.controller?.findSMI("Check")?.value = value;
  }

  void setHandsUp(bool value) {
    state = state.copyWith(handsUp: value);
    state.controller?.findSMI("hands_up")?.value = value;
  }

  void setLookLeftRight(double value) {
    state = state.copyWith(lookLeftRight: value);
    state.controller?.findSMI("Look")?.value = value;
  }

  // Set the Rive controller (called when the Rive animation is initialized)
  void setController(StateMachineController controller) {
    state = state.copyWith(controller: controller);
  }
}

// Private Riverpod providers (underscore prefix makes them private)
final _riveAnimationProvider =
    StateNotifierProvider<RiveAnimationNotifier, RiveState>(
      (ref) => RiveAnimationNotifier(),
    );

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});

  final emailCtrl = TextEditingController(text: "jhon@gmail.com");
  final passCtrl = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riveAnimationController = ref.watch(_riveAnimationProvider.notifier);

    final signinState = ref.watch(loginNotifierProvider);
    ref.listen<AsyncValue<SigninEntity?>>(loginNotifierProvider, (prev, next) {
      next.whenData((success) {
        if (success != null) {
          context.go(AppRoutes.home);
        }
      });
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
                  CommonTextfieldWithTitle(
                    "Email",
                    emailCtrl,
                    onChnage: (value) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setLookingDown(true);
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setHandsUp(false);
                      if (value.isEmpty) {
                        ref
                            .read(_riveAnimationProvider.notifier)
                            .setLookingDown(false);
                      }
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setLookLeftRight(value.length * 2.0);
                    },
                    onsubmit: (_) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setLookingDown(false);
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setHandsUp(false);
                    },
                  ),
                  CommonTextfieldWithTitle(
                    "Password",
                    onChnage: (value) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setHandsUp(true);
                      if (value.isEmpty) {
                        ref
                            .read(_riveAnimationProvider.notifier)
                            .setHandsUp(false);
                      }
                    },
                    onsubmit: (_) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setHandsUp(false);
                    },

                    passCtrl,
                  ),
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
                  if (signinState.hasError)
                    Text(
                      signinState.error.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),

                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      context.go(AppRoutes.signUp);
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
