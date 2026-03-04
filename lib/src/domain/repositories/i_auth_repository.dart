import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/email_verification/email_verified_response.dart';
import 'package:paycron_app/src/data/models/sign_in/signin_response.dart';
import 'package:paycron_app/src/data/models/sign_up/signup_response.dart';

abstract base class IAuthRepository extends Repository {
  Future<Result<SigninResponse, Failure>> login(String email, String password);
  Future<Result<SignupResponse, Failure>> signup(String email, String password);
  Future<Result<EmailVerifiedResponse, Failure>> emailVerification(String otp);
}
