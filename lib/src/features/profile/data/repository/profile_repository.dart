import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/services/network/i_api_service.dart';
import 'package:template/src/core/utils/api_end_points.dart';

import 'package:template/src/features/profile/data/model/profile_response.dart';
import 'package:template/src/features/profile/domain/repository/i_profile_repositoty.dart';

final class ProfileRepository extends IProfileRepository {
  final IApiService _apiService;
  ProfileRepository(this._apiService);
  @override
  Future<Result<ProfileResponse, Failure>> getProfile() async {
    return asyncGuard(() async {
      final result = await _apiService.get(ApiEndpoints.userProfile);
      return ProfileResponse.fromJson(result);
    });
  }
}
