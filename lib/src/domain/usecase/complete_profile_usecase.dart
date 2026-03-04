import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/complete_profile_response/complete_profile_response.dart';
import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/domain/repositories/i_profile_repositoty.dart';


class CompleteProfileUsecase {
  final IProfileRepository repo;

  CompleteProfileUsecase({required this.repo});


  Future<Result<CompleteProfileEntity, Failure>> execute({
    required Map<String, dynamic> profileData,
  }) async {
    final response = await repo.completeProfile(profileData);

    if (response is FailureResult) {
      return FailureResult((response as FailureResult).error);
    }

    final completeProfileEntity = CompleteProfileEntity(
      success: ((response as Success).data as CompleteProfileResponse).success,
    );

    return Success(completeProfileEntity);
  }
}