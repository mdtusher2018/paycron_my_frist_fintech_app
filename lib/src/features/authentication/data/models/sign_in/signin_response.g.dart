// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    _SigninResponse(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: SigninData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SigninResponseToJson(_SigninResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_SigninData _$SigninDataFromJson(Map<String, dynamic> json) => _SigninData(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$SigninDataToJson(_SigninData instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
