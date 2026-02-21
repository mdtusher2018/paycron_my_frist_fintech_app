// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verified_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailVerifiedResponse _$EmailVerifiedResponseFromJson(
  Map<String, dynamic> json,
) => _EmailVerifiedResponse(
  statusCode: (json['statusCode'] as num).toInt(),
  status: json['status'] as bool,
  message: json['message'] as String,
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$EmailVerifiedResponseToJson(
  _EmailVerifiedResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
