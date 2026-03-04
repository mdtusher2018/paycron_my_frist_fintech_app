// domain/usecases/signup_usecase.dart

import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/services/storage/i_local_storage_service.dart';
import 'package:paycron_app/src/core/services/storage/storage_key.dart';
import 'package:paycron_app/src/core/utils/extension/validator_extension.dart';
import 'package:paycron_app/src/data/models/sign_up/signup_response.dart';
import 'package:paycron_app/src/domain/repositories/i_auth_repository.dart';
import 'package:paycron_app/src/domain/entites/auth_entity.dart';

class SignupUseCase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  SignupUseCase({required this.localStorage, required this.authRepository});

  Future<Result<SignupEntity, Failure>> execute({
    required String email,
    required String password,

  }) async {
    email = email.trim();
    password = password.trim();


    // 🔹 Validation
    if (email.isNullOrEmpty && password.isNullOrEmpty) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter your email and password.",
        ),
      );
    }

    if (email.isNullOrEmpty) {
      return FailureResult(
        Failure(type: FailureType.unknown, message: "Email cannot be empty."),
      );
    }

    if (email.isInvalidEmail) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter a valid email address.",
        ),
      );
    }

    if (password.isNullOrEmpty) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password cannot be empty.",
        ),
      );
    }

    if (password.isInvalidPassword) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password must be 6–16 characters long.",
        ),
      );
    }


    // 🔹 Call repository (API)
    final response = await authRepository.signup(email, password);
    if (response is FailureResult) {
      return FailureResult((response as FailureResult).error);
    }

    final signupEntity = SignupEntity(
      signUpToken: ((response as Success).data! as SignupResponse).token,
    );

    // 🔹 Save token locally
    await localStorage.saveKey(
      StorageKey.accessToken,
      signupEntity.signUpToken,
    );

    return Success(signupEntity);
  }
}
