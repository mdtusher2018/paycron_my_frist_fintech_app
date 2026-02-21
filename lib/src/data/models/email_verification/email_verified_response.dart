import 'package:freezed_annotation/freezed_annotation.dart';
part 'email_verified_response.freezed.dart';
part 'email_verified_response.g.dart';

@freezed
abstract class EmailVerifiedResponse with _$EmailVerifiedResponse {
  const factory EmailVerifiedResponse({
    required int statusCode,
    required bool status,
    required String message,
    required String accessToken,
    required String refreshToken,
  }) = _EmailVerifiedResponse;

  factory EmailVerifiedResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifiedResponseFromJson(json);
}
