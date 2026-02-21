// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
abstract class SigninResponse with _$SigninResponse {
  const factory SigninResponse({
    required String status,
    required int statusCode,
    required String message,
    required String token,
    required List<dynamic> errors,
  }) = _SigninResponse;

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}
