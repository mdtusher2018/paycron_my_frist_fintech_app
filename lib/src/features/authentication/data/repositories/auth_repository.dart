import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/services/network/i_api_service.dart';
import 'package:template/src/core/services/storage/i_local_storage_service.dart';
import 'package:template/src/core/utils/api_end_points.dart';
import 'package:template/src/features/authentication/data/models/email_verification/email_verified_response.dart';
import 'package:template/src/features/authentication/data/models/sign_in/signin_response.dart';
import 'package:template/src/features/authentication/data/models/sign_up/signup_response.dart';
import 'package:template/src/features/authentication/domain/repositories/i_auth_repository.dart';

final class AuthRepository extends IAuthRepository {
  final IApiService api;
  final ILocalStorageService localStorageService;
  AuthRepository(this.api, this.localStorageService);

  @override
  Future<Result<SigninResponse, Failure>> login(String email, String password) {
    return asyncGuard(() async {
      final res = await api.post(ApiEndpoints.signin, {
        "email": email,
        "password": password,
      });

      return SigninResponse.fromJson(res);
    });
  }

  @override
  Future<Result<SignupResponse, Failure>> signup(
    String email,
    String password,
  ) async {
    return asyncGuard(() async {
      final res = await api.post(ApiEndpoints.signup, {
        "email": email,
        "password": password,
        "name": "John Doe",
        "phoneNumber": "+8801646456527",
        "registerWith": "credentials",
      });
      return SignupResponse.fromJson(res);
    });
  }

  @override
  Future<Result<EmailVerifiedResponse, Failure>> emailVerification(
    String otp,
  ) async {
    return asyncGuard(() async {
      final res = await api.post(ApiEndpoints.emailVerification, {
        "otp": otp,
        "purpose": "email-verification",
      });

      return EmailVerifiedResponse.fromJson(res);
    });
  }
}
