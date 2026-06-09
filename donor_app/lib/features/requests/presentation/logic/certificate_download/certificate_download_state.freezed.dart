// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_download_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificateDownloadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateDownloadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateDownloadState()';
}


}

/// @nodoc
class $CertificateDownloadStateCopyWith<$Res>  {
$CertificateDownloadStateCopyWith(CertificateDownloadState _, $Res Function(CertificateDownloadState) __);
}


/// Adds pattern-matching-related methods to [CertificateDownloadState].
extension CertificateDownloadStatePatterns on CertificateDownloadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CertificateDownloadInitial value)?  initial,TResult Function( CertificateDownloadLoading value)?  loading,TResult Function( CertificateDownloadSuccess value)?  success,TResult Function( CertificateDownloadError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificateDownloadInitial() when initial != null:
return initial(_that);case CertificateDownloadLoading() when loading != null:
return loading(_that);case CertificateDownloadSuccess() when success != null:
return success(_that);case CertificateDownloadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CertificateDownloadInitial value)  initial,required TResult Function( CertificateDownloadLoading value)  loading,required TResult Function( CertificateDownloadSuccess value)  success,required TResult Function( CertificateDownloadError value)  error,}){
final _that = this;
switch (_that) {
case _CertificateDownloadInitial():
return initial(_that);case CertificateDownloadLoading():
return loading(_that);case CertificateDownloadSuccess():
return success(_that);case CertificateDownloadError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CertificateDownloadInitial value)?  initial,TResult? Function( CertificateDownloadLoading value)?  loading,TResult? Function( CertificateDownloadSuccess value)?  success,TResult? Function( CertificateDownloadError value)?  error,}){
final _that = this;
switch (_that) {
case _CertificateDownloadInitial() when initial != null:
return initial(_that);case CertificateDownloadLoading() when loading != null:
return loading(_that);case CertificateDownloadSuccess() when success != null:
return success(_that);case CertificateDownloadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String filePath)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificateDownloadInitial() when initial != null:
return initial();case CertificateDownloadLoading() when loading != null:
return loading();case CertificateDownloadSuccess() when success != null:
return success(_that.filePath);case CertificateDownloadError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String filePath)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case _CertificateDownloadInitial():
return initial();case CertificateDownloadLoading():
return loading();case CertificateDownloadSuccess():
return success(_that.filePath);case CertificateDownloadError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String filePath)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case _CertificateDownloadInitial() when initial != null:
return initial();case CertificateDownloadLoading() when loading != null:
return loading();case CertificateDownloadSuccess() when success != null:
return success(_that.filePath);case CertificateDownloadError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CertificateDownloadInitial implements CertificateDownloadState {
  const _CertificateDownloadInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificateDownloadInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateDownloadState.initial()';
}


}




/// @nodoc


class CertificateDownloadLoading implements CertificateDownloadState {
  const CertificateDownloadLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateDownloadLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateDownloadState.loading()';
}


}




/// @nodoc


class CertificateDownloadSuccess implements CertificateDownloadState {
  const CertificateDownloadSuccess(this.filePath);
  

 final  String filePath;

/// Create a copy of CertificateDownloadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateDownloadSuccessCopyWith<CertificateDownloadSuccess> get copyWith => _$CertificateDownloadSuccessCopyWithImpl<CertificateDownloadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateDownloadSuccess&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,filePath);

@override
String toString() {
  return 'CertificateDownloadState.success(filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $CertificateDownloadSuccessCopyWith<$Res> implements $CertificateDownloadStateCopyWith<$Res> {
  factory $CertificateDownloadSuccessCopyWith(CertificateDownloadSuccess value, $Res Function(CertificateDownloadSuccess) _then) = _$CertificateDownloadSuccessCopyWithImpl;
@useResult
$Res call({
 String filePath
});




}
/// @nodoc
class _$CertificateDownloadSuccessCopyWithImpl<$Res>
    implements $CertificateDownloadSuccessCopyWith<$Res> {
  _$CertificateDownloadSuccessCopyWithImpl(this._self, this._then);

  final CertificateDownloadSuccess _self;
  final $Res Function(CertificateDownloadSuccess) _then;

/// Create a copy of CertificateDownloadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filePath = null,}) {
  return _then(CertificateDownloadSuccess(
null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CertificateDownloadError implements CertificateDownloadState {
  const CertificateDownloadError({required this.error});
  

 final  ApiErrorModel error;

/// Create a copy of CertificateDownloadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateDownloadErrorCopyWith<CertificateDownloadError> get copyWith => _$CertificateDownloadErrorCopyWithImpl<CertificateDownloadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateDownloadError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CertificateDownloadState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CertificateDownloadErrorCopyWith<$Res> implements $CertificateDownloadStateCopyWith<$Res> {
  factory $CertificateDownloadErrorCopyWith(CertificateDownloadError value, $Res Function(CertificateDownloadError) _then) = _$CertificateDownloadErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$CertificateDownloadErrorCopyWithImpl<$Res>
    implements $CertificateDownloadErrorCopyWith<$Res> {
  _$CertificateDownloadErrorCopyWithImpl(this._self, this._then);

  final CertificateDownloadError _self;
  final $Res Function(CertificateDownloadError) _then;

/// Create a copy of CertificateDownloadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CertificateDownloadError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
