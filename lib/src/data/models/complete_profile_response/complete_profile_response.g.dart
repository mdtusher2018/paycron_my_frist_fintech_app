// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompleteProfileResponse _$CompleteProfileResponseFromJson(
  Map<String, dynamic> json,
) => _CompleteProfileResponse(
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$CompleteProfileResponseToJson(
  _CompleteProfileResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
