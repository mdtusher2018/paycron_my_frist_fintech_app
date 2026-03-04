import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/profile/profile_response.dart';
import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/domain/repositories/i_profile_repositoty.dart';

class GetProfileUsecase {
  final IProfileRepository repository;
  GetProfileUsecase({required this.repository});
  Future<Result<GetMyProfileEntity, Failure>> profileUseCase() async {
    final result = await repository.getProfile();

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }

    final userModel = (result as Success).data as ProfileResponse;
    final GetMyProfileEntity userEntity = GetMyProfileEntity(
      userName: userModel.data.attributes.first.fullName,
    );
    return Success(userEntity);
  }
}
