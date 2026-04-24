// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => _ProfileData(
  id: json['_id'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  accountStatus: json['account_status'] as String,
  role: json['role'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'account_status': instance.accountStatus,
      'role': instance.role,
      'created_at': instance.createdAt.toIso8601String(),
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'address': instance.address,
    };

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  road: json['road'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  postalCode: json['postal_code'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'road': instance.road,
  'city': instance.city,
  'state': instance.state,
  'postal_code': instance.postalCode,
  'country': instance.country,
};
