// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileLoading value)?  loading,TResult Function( ProfileData value)?  data,TResult Function( ProfileError value)?  error,TResult Function( ProfileRefetching value)?  refetching,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading(_that);case ProfileData() when data != null:
return data(_that);case ProfileError() when error != null:
return error(_that);case ProfileRefetching() when refetching != null:
return refetching(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileLoading value)  loading,required TResult Function( ProfileData value)  data,required TResult Function( ProfileError value)  error,required TResult Function( ProfileRefetching value)  refetching,}){
final _that = this;
switch (_that) {
case ProfileLoading():
return loading(_that);case ProfileData():
return data(_that);case ProfileError():
return error(_that);case ProfileRefetching():
return refetching(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileLoading value)?  loading,TResult? Function( ProfileData value)?  data,TResult? Function( ProfileError value)?  error,TResult? Function( ProfileRefetching value)?  refetching,}){
final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading(_that);case ProfileData() when data != null:
return data(_that);case ProfileError() when error != null:
return error(_that);case ProfileRefetching() when refetching != null:
return refetching(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( UserProfileEntity profile)?  data,TResult Function( Object error,  StackTrace trace,  UserProfileEntity? profile)?  error,TResult Function( UserProfileEntity profile)?  refetching,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading();case ProfileData() when data != null:
return data(_that.profile);case ProfileError() when error != null:
return error(_that.error,_that.trace,_that.profile);case ProfileRefetching() when refetching != null:
return refetching(_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( UserProfileEntity profile)  data,required TResult Function( Object error,  StackTrace trace,  UserProfileEntity? profile)  error,required TResult Function( UserProfileEntity profile)  refetching,}) {final _that = this;
switch (_that) {
case ProfileLoading():
return loading();case ProfileData():
return data(_that.profile);case ProfileError():
return error(_that.error,_that.trace,_that.profile);case ProfileRefetching():
return refetching(_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( UserProfileEntity profile)?  data,TResult? Function( Object error,  StackTrace trace,  UserProfileEntity? profile)?  error,TResult? Function( UserProfileEntity profile)?  refetching,}) {final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading();case ProfileData() when data != null:
return data(_that.profile);case ProfileError() when error != null:
return error(_that.error,_that.trace,_that.profile);case ProfileRefetching() when refetching != null:
return refetching(_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class ProfileLoading with DiagnosticableTreeMixin implements ProfileState {
  const ProfileLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class ProfileData with DiagnosticableTreeMixin implements ProfileState {
  const ProfileData(this.profile);
  

 final  UserProfileEntity profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDataCopyWith<ProfileData> get copyWith => _$ProfileDataCopyWithImpl<ProfileData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileState.data'))
    ..add(DiagnosticsProperty('profile', profile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileData&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileState.data(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileDataCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileDataCopyWith(ProfileData value, $Res Function(ProfileData) _then) = _$ProfileDataCopyWithImpl;
@useResult
$Res call({
 UserProfileEntity profile
});




}
/// @nodoc
class _$ProfileDataCopyWithImpl<$Res>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._self, this._then);

  final ProfileData _self;
  final $Res Function(ProfileData) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ProfileData(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileEntity,
  ));
}


}

/// @nodoc


class ProfileError with DiagnosticableTreeMixin implements ProfileState {
  const ProfileError(this.error, this.trace, {this.profile});
  

 final  Object error;
 final  StackTrace trace;
 final  UserProfileEntity? profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileErrorCopyWith<ProfileError> get copyWith => _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileState.error'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('trace', trace))..add(DiagnosticsProperty('profile', profile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.trace, trace) || other.trace == trace)&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),trace,profile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileState.error(error: $error, trace: $trace, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(ProfileError value, $Res Function(ProfileError) _then) = _$ProfileErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace trace, UserProfileEntity? profile
});




}
/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res>
    implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? trace = null,Object? profile = freezed,}) {
  return _then(ProfileError(
null == error ? _self.error : error ,null == trace ? _self.trace : trace // ignore: cast_nullable_to_non_nullable
as StackTrace,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileEntity?,
  ));
}


}

/// @nodoc


class ProfileRefetching with DiagnosticableTreeMixin implements ProfileState {
  const ProfileRefetching(this.profile);
  

 final  UserProfileEntity profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileRefetchingCopyWith<ProfileRefetching> get copyWith => _$ProfileRefetchingCopyWithImpl<ProfileRefetching>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileState.refetching'))
    ..add(DiagnosticsProperty('profile', profile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileRefetching&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileState.refetching(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileRefetchingCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileRefetchingCopyWith(ProfileRefetching value, $Res Function(ProfileRefetching) _then) = _$ProfileRefetchingCopyWithImpl;
@useResult
$Res call({
 UserProfileEntity profile
});




}
/// @nodoc
class _$ProfileRefetchingCopyWithImpl<$Res>
    implements $ProfileRefetchingCopyWith<$Res> {
  _$ProfileRefetchingCopyWithImpl(this._self, this._then);

  final ProfileRefetching _self;
  final $Res Function(ProfileRefetching) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ProfileRefetching(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileEntity,
  ));
}


}

// dart format on
