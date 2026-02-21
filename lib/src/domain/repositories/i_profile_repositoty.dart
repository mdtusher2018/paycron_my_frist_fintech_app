import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/repository.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/data/models/profile/profile_response.dart';

abstract base class IProfileRepository extends Repository {
  Future<Result<ProfileResponse, Failure>> getProfile();
}
