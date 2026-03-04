import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/complete_profile_response/complete_profile_response.dart';
import 'package:paycron_app/src/data/models/profile/profile_response.dart';

abstract base class IProfileRepository extends Repository {
  Future<Result<ProfileResponse, Failure>> getProfile();
  Future<Result<CompleteProfileResponse, Failure>> completeProfile(
      Map<String, dynamic> profileData);

}
