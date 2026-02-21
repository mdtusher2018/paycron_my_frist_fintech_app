// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    _SignupResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      status: json['status'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
      errors: json['errors'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$SignupResponseToJson(_SignupResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
    };

_SignupData _$SignupDataFromJson(Map<String, dynamic> json) => _SignupData(
  type: json['type'] as String? ?? 'user',
  signUpToken: json['signUpToken'] as String,
);

Map<String, dynamic> _$SignupDataToJson(_SignupData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'signUpToken': instance.signUpToken,
    };
