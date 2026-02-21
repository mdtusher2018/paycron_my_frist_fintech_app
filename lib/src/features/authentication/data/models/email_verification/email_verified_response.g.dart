// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verified_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailVerifiedResponse _$EmailVerifiedResponseFromJson(
  Map<String, dynamic> json,
) => _EmailVerifiedResponse(
  status: json['status'] as String,
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  accessToken: json['accessToken'] as String,
  errors: json['errors'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$EmailVerifiedResponseToJson(
  _EmailVerifiedResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'accessToken': instance.accessToken,
  'errors': instance.errors,
};
