import 'package:paycron_app/src/domain/entites/auth_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';

import 'package:paycron_app/src/domain/usecase/signup_usecase.dart';
part 'signup_notifier.g.dart';

@riverpod
class SignupNotifier extends _$SignupNotifier {
  late final SignupUseCase signupUseCase;

  @override
  FutureOr<SignupEntity?> build() {
    signupUseCase = ref.watch(signupUseCaseProvider);
    return null;
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final result = await signupUseCase.execute(
      email: email,
      password: password,

    );

    if (result is Success) {
      state = AsyncData((result as Success).data);
      return;
    } else if (result is FailureResult) {
      final Failure error = (result as FailureResult).error;
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.fromString("No trace found"),
      );
    }

    return;
  }
}
