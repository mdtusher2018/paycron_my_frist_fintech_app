// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SigninResponse {

 bool get status; int get statusCode; String get message; SigninData get data;
/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninResponseCopyWith<SigninResponse> get copyWith => _$SigninResponseCopyWithImpl<SigninResponse>(this as SigninResponse, _$identity);

  /// Serializes this SigninResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,data);

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SigninResponseCopyWith<$Res>  {
  factory $SigninResponseCopyWith(SigninResponse value, $Res Function(SigninResponse) _then) = _$SigninResponseCopyWithImpl;
@useResult
$Res call({
 bool status, int statusCode, String message, SigninData data
});


$SigninDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SigninResponseCopyWithImpl<$Res>
    implements $SigninResponseCopyWith<$Res> {
  _$SigninResponseCopyWithImpl(this._self, this._then);

  final SigninResponse _self;
  final $Res Function(SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SigninData,
  ));
}
/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SigninDataCopyWith<$Res> get data {
  
  return $SigninDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SigninResponse].
extension SigninResponsePatterns on SigninResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SigninResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SigninResponse value)  $default,){
final _that = this;
switch (_that) {
case _SigninResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SigninResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  int statusCode,  String message,  SigninData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  int statusCode,  String message,  SigninData data)  $default,) {final _that = this;
switch (_that) {
case _SigninResponse():
return $default(_that.status,_that.statusCode,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  int statusCode,  String message,  SigninData data)?  $default,) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SigninResponse implements SigninResponse {
  const _SigninResponse({required this.status, required this.statusCode, required this.message, required this.data});
  factory _SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

@override final  bool status;
@override final  int statusCode;
@override final  String message;
@override final  SigninData data;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninResponseCopyWith<_SigninResponse> get copyWith => __$SigninResponseCopyWithImpl<_SigninResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SigninResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,data);

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SigninResponseCopyWith<$Res> implements $SigninResponseCopyWith<$Res> {
  factory _$SigninResponseCopyWith(_SigninResponse value, $Res Function(_SigninResponse) _then) = __$SigninResponseCopyWithImpl;
@override @useResult
$Res call({
 bool status, int statusCode, String message, SigninData data
});


@override $SigninDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SigninResponseCopyWithImpl<$Res>
    implements _$SigninResponseCopyWith<$Res> {
  __$SigninResponseCopyWithImpl(this._self, this._then);

  final _SigninResponse _self;
  final $Res Function(_SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? data = null,}) {
  return _then(_SigninResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SigninData,
  ));
}

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SigninDataCopyWith<$Res> get data {
  
  return $SigninDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SigninData {

 String get accessToken; String get refreshToken;
/// Create a copy of SigninData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninDataCopyWith<SigninData> get copyWith => _$SigninDataCopyWithImpl<SigninData>(this as SigninData, _$identity);

  /// Serializes this SigninData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'SigninData(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $SigninDataCopyWith<$Res>  {
  factory $SigninDataCopyWith(SigninData value, $Res Function(SigninData) _then) = _$SigninDataCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class _$SigninDataCopyWithImpl<$Res>
    implements $SigninDataCopyWith<$Res> {
  _$SigninDataCopyWithImpl(this._self, this._then);

  final SigninData _self;
  final $Res Function(SigninData) _then;

/// Create a copy of SigninData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SigninData].
extension SigninDataPatterns on SigninData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SigninData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SigninData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SigninData value)  $default,){
final _that = this;
switch (_that) {
case _SigninData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SigninData value)?  $default,){
final _that = this;
switch (_that) {
case _SigninData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SigninData() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _SigninData():
return $default(_that.accessToken,_that.refreshToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _SigninData() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SigninData implements SigninData {
  const _SigninData({required this.accessToken, required this.refreshToken});
  factory _SigninData.fromJson(Map<String, dynamic> json) => _$SigninDataFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of SigninData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninDataCopyWith<_SigninData> get copyWith => __$SigninDataCopyWithImpl<_SigninData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SigninDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'SigninData(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$SigninDataCopyWith<$Res> implements $SigninDataCopyWith<$Res> {
  factory _$SigninDataCopyWith(_SigninData value, $Res Function(_SigninData) _then) = __$SigninDataCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class __$SigninDataCopyWithImpl<$Res>
    implements _$SigninDataCopyWith<$Res> {
  __$SigninDataCopyWithImpl(this._self, this._then);

  final _SigninData _self;
  final $Res Function(_SigninData) _then;

/// Create a copy of SigninData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_SigninData(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
