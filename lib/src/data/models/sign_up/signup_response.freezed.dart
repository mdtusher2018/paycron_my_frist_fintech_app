// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupResponse {

 int get statusCode; bool get status; String get message; String get token; List<dynamic> get errors;
/// Create a copy of SignupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupResponseCopyWith<SignupResponse> get copyWith => _$SignupResponseCopyWithImpl<SignupResponse>(this as SignupResponse, _$identity);

  /// Serializes this SignupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupResponse&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,status,message,token,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'SignupResponse(statusCode: $statusCode, status: $status, message: $message, token: $token, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $SignupResponseCopyWith<$Res>  {
  factory $SignupResponseCopyWith(SignupResponse value, $Res Function(SignupResponse) _then) = _$SignupResponseCopyWithImpl;
@useResult
$Res call({
 int statusCode, bool status, String message, String token, List<dynamic> errors
});




}
/// @nodoc
class _$SignupResponseCopyWithImpl<$Res>
    implements $SignupResponseCopyWith<$Res> {
  _$SignupResponseCopyWithImpl(this._self, this._then);

  final SignupResponse _self;
  final $Res Function(SignupResponse) _then;

/// Create a copy of SignupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? status = null,Object? message = null,Object? token = null,Object? errors = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupResponse].
extension SignupResponsePatterns on SignupResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupResponse value)  $default,){
final _that = this;
switch (_that) {
case _SignupResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SignupResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int statusCode,  bool status,  String message,  String token,  List<dynamic> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupResponse() when $default != null:
return $default(_that.statusCode,_that.status,_that.message,_that.token,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int statusCode,  bool status,  String message,  String token,  List<dynamic> errors)  $default,) {final _that = this;
switch (_that) {
case _SignupResponse():
return $default(_that.statusCode,_that.status,_that.message,_that.token,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int statusCode,  bool status,  String message,  String token,  List<dynamic> errors)?  $default,) {final _that = this;
switch (_that) {
case _SignupResponse() when $default != null:
return $default(_that.statusCode,_that.status,_that.message,_that.token,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignupResponse implements SignupResponse {
  const _SignupResponse({required this.statusCode, required this.status, required this.message, required this.token, final  List<dynamic> errors = const []}): _errors = errors;
  factory _SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

@override final  int statusCode;
@override final  bool status;
@override final  String message;
@override final  String token;
 final  List<dynamic> _errors;
@override@JsonKey() List<dynamic> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of SignupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupResponseCopyWith<_SignupResponse> get copyWith => __$SignupResponseCopyWithImpl<_SignupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupResponse&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,status,message,token,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'SignupResponse(statusCode: $statusCode, status: $status, message: $message, token: $token, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SignupResponseCopyWith<$Res> implements $SignupResponseCopyWith<$Res> {
  factory _$SignupResponseCopyWith(_SignupResponse value, $Res Function(_SignupResponse) _then) = __$SignupResponseCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, bool status, String message, String token, List<dynamic> errors
});




}
/// @nodoc
class __$SignupResponseCopyWithImpl<$Res>
    implements _$SignupResponseCopyWith<$Res> {
  __$SignupResponseCopyWithImpl(this._self, this._then);

  final _SignupResponse _self;
  final $Res Function(_SignupResponse) _then;

/// Create a copy of SignupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? status = null,Object? message = null,Object? token = null,Object? errors = null,}) {
  return _then(_SignupResponse(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}


/// @nodoc
mixin _$SignupData {

 String get type; String get signUpToken;
/// Create a copy of SignupData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupDataCopyWith<SignupData> get copyWith => _$SignupDataCopyWithImpl<SignupData>(this as SignupData, _$identity);

  /// Serializes this SignupData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupData&&(identical(other.type, type) || other.type == type)&&(identical(other.signUpToken, signUpToken) || other.signUpToken == signUpToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,signUpToken);

@override
String toString() {
  return 'SignupData(type: $type, signUpToken: $signUpToken)';
}


}

/// @nodoc
abstract mixin class $SignupDataCopyWith<$Res>  {
  factory $SignupDataCopyWith(SignupData value, $Res Function(SignupData) _then) = _$SignupDataCopyWithImpl;
@useResult
$Res call({
 String type, String signUpToken
});




}
/// @nodoc
class _$SignupDataCopyWithImpl<$Res>
    implements $SignupDataCopyWith<$Res> {
  _$SignupDataCopyWithImpl(this._self, this._then);

  final SignupData _self;
  final $Res Function(SignupData) _then;

/// Create a copy of SignupData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? signUpToken = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,signUpToken: null == signUpToken ? _self.signUpToken : signUpToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupData].
extension SignupDataPatterns on SignupData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupData value)  $default,){
final _that = this;
switch (_that) {
case _SignupData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupData value)?  $default,){
final _that = this;
switch (_that) {
case _SignupData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String signUpToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupData() when $default != null:
return $default(_that.type,_that.signUpToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String signUpToken)  $default,) {final _that = this;
switch (_that) {
case _SignupData():
return $default(_that.type,_that.signUpToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String signUpToken)?  $default,) {final _that = this;
switch (_that) {
case _SignupData() when $default != null:
return $default(_that.type,_that.signUpToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignupData implements SignupData {
  const _SignupData({this.type = 'user', required this.signUpToken});
  factory _SignupData.fromJson(Map<String, dynamic> json) => _$SignupDataFromJson(json);

@override@JsonKey() final  String type;
@override final  String signUpToken;

/// Create a copy of SignupData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupDataCopyWith<_SignupData> get copyWith => __$SignupDataCopyWithImpl<_SignupData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupData&&(identical(other.type, type) || other.type == type)&&(identical(other.signUpToken, signUpToken) || other.signUpToken == signUpToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,signUpToken);

@override
String toString() {
  return 'SignupData(type: $type, signUpToken: $signUpToken)';
}


}

/// @nodoc
abstract mixin class _$SignupDataCopyWith<$Res> implements $SignupDataCopyWith<$Res> {
  factory _$SignupDataCopyWith(_SignupData value, $Res Function(_SignupData) _then) = __$SignupDataCopyWithImpl;
@override @useResult
$Res call({
 String type, String signUpToken
});




}
/// @nodoc
class __$SignupDataCopyWithImpl<$Res>
    implements _$SignupDataCopyWith<$Res> {
  __$SignupDataCopyWithImpl(this._self, this._then);

  final _SignupData _self;
  final $Res Function(_SignupData) _then;

/// Create a copy of SignupData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? signUpToken = null,}) {
  return _then(_SignupData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,signUpToken: null == signUpToken ? _self.signUpToken : signUpToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
