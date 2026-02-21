import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/data/models/profile/profile_response.dart';
import 'package:template/src/domain/entites/user_profile_entity.dart';
import 'package:template/src/domain/repositories/i_profile_repositoty.dart';

class ProfileUsecase {
  final IProfileRepository repository;
  ProfileUsecase({required this.repository});
  Future<Result<UserProfileEntity, Failure>> profileUseCase() async {
    final result = await repository.getProfile();

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }

    final userModel = (result as Success).data as ProfileResponse;
    final UserProfileEntity userEntity = UserProfileEntity(
      userName: userModel.data.attributes.first.fullName,
    );
    return Success(userEntity);
  }
}
