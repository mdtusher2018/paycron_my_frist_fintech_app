// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
abstract class SigninResponse with _$SigninResponse {
  const factory SigninResponse({
    required bool status,
    required int statusCode,
    required String message,
    required SigninData data,
  }) = _SigninResponse;

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}

@freezed
abstract class SigninData with _$SigninData {
  const factory SigninData({
    required String accessToken,
    required String refreshToken,
  }) = _SigninData;

  factory SigninData.fromJson(Map<String, dynamic> json) =>
      _$SigninDataFromJson(json);
}
