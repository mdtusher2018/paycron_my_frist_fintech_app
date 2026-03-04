import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/profile/profile_response.dart';

abstract base class IProfileRepository extends Repository {
  Future<Result<ProfileResponse, Failure>> getProfile();
}
