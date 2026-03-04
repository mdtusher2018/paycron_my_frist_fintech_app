import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_profile_response.freezed.dart';
part 'complete_profile_response.g.dart';

@freezed
abstract class CompleteProfileResponse with _$CompleteProfileResponse {
  const factory CompleteProfileResponse({
    required String message,
    required bool success,
  }) = _CompleteProfileResponse;

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileResponseFromJson(json);
}
