// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    _SigninResponse(
      status: json['status'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      token: json['token'] as String,
      errors: json['errors'] as List<dynamic>,
    );

Map<String, dynamic> _$SigninResponseToJson(_SigninResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
    };
