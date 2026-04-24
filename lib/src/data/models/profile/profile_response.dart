// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    String? message,
    required ProfileData data,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    @JsonKey(name: '_id') required String id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'account_status') required String accountStatus,
    required String role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'date_of_birth') required DateTime dateOfBirth,
    required Address address,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String road,
    required String city,
    required String state,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
