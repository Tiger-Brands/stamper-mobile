// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_restoration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaceRestorationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceRestorationStateCopyWith<$Res> {
  factory $FaceRestorationStateCopyWith(FaceRestorationState value,
          $Res Function(FaceRestorationState) then) =
      _$FaceRestorationStateCopyWithImpl<$Res, FaceRestorationState>;
}

/// @nodoc
class _$FaceRestorationStateCopyWithImpl<$Res,
        $Val extends FaceRestorationState>
    implements $FaceRestorationStateCopyWith<$Res> {
  _$FaceRestorationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FaceRestorationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FaceRestorationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ProcessingCopyWith<$Res> {
  factory _$$_ProcessingCopyWith(
          _$_Processing value, $Res Function(_$_Processing) then) =
      __$$_ProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProcessingCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_Processing>
    implements _$$_ProcessingCopyWith<$Res> {
  __$$_ProcessingCopyWithImpl(
      _$_Processing _value, $Res Function(_$_Processing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Processing implements _Processing {
  const _$_Processing();

  @override
  String toString() {
    return 'FaceRestorationState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Processing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements FaceRestorationState {
  const factory _Processing() = _$_Processing;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({GfpganPrediction prediction});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
  }) {
    return _then(_$_Success(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as GfpganPrediction,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.prediction});

  @override
  final GfpganPrediction prediction;

  @override
  String toString() {
    return 'FaceRestorationState.success(prediction: $prediction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prediction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return success(prediction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return success?.call(prediction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(prediction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements FaceRestorationState {
  const factory _Success({required final GfpganPrediction prediction}) =
      _$_Success;

  GfpganPrediction get prediction;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$_Failure(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'FaceRestorationState.failure(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return failure(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return failure?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements FaceRestorationState {
  const factory _Failure({required final String reason}) = _$_Failure;

  String get reason;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImagePickingCopyWith<$Res> {
  factory _$$_ImagePickingCopyWith(
          _$_ImagePicking value, $Res Function(_$_ImagePicking) then) =
      __$$_ImagePickingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ImagePickingCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_ImagePicking>
    implements _$$_ImagePickingCopyWith<$Res> {
  __$$_ImagePickingCopyWithImpl(
      _$_ImagePicking _value, $Res Function(_$_ImagePicking) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ImagePicking implements _ImagePicking {
  const _$_ImagePicking();

  @override
  String toString() {
    return 'FaceRestorationState.pickingImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ImagePicking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return pickingImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return pickingImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (pickingImage != null) {
      return pickingImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return pickingImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return pickingImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (pickingImage != null) {
      return pickingImage(this);
    }
    return orElse();
  }
}

abstract class _ImagePicking implements FaceRestorationState {
  const factory _ImagePicking() = _$_ImagePicking;
}

/// @nodoc
abstract class _$$_ImagePickedCopyWith<$Res> {
  factory _$$_ImagePickedCopyWith(
          _$_ImagePicked value, $Res Function(_$_ImagePicked) then) =
      __$$_ImagePickedCopyWithImpl<$Res>;
  @useResult
  $Res call({File image});
}

/// @nodoc
class __$$_ImagePickedCopyWithImpl<$Res>
    extends _$FaceRestorationStateCopyWithImpl<$Res, _$_ImagePicked>
    implements _$$_ImagePickedCopyWith<$Res> {
  __$$_ImagePickedCopyWithImpl(
      _$_ImagePicked _value, $Res Function(_$_ImagePicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_ImagePicked(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_ImagePicked implements _ImagePicked {
  const _$_ImagePicked(this.image);

  @override
  final File image;

  @override
  String toString() {
    return 'FaceRestorationState.pickedImage(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagePicked &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagePickedCopyWith<_$_ImagePicked> get copyWith =>
      __$$_ImagePickedCopyWithImpl<_$_ImagePicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(GfpganPrediction prediction) success,
    required TResult Function(String reason) failure,
    required TResult Function() pickingImage,
    required TResult Function(File image) pickedImage,
  }) {
    return pickedImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(GfpganPrediction prediction)? success,
    TResult? Function(String reason)? failure,
    TResult? Function()? pickingImage,
    TResult? Function(File image)? pickedImage,
  }) {
    return pickedImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(GfpganPrediction prediction)? success,
    TResult Function(String reason)? failure,
    TResult Function()? pickingImage,
    TResult Function(File image)? pickedImage,
    required TResult orElse(),
  }) {
    if (pickedImage != null) {
      return pickedImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_ImagePicking value) pickingImage,
    required TResult Function(_ImagePicked value) pickedImage,
  }) {
    return pickedImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_ImagePicking value)? pickingImage,
    TResult? Function(_ImagePicked value)? pickedImage,
  }) {
    return pickedImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_ImagePicking value)? pickingImage,
    TResult Function(_ImagePicked value)? pickedImage,
    required TResult orElse(),
  }) {
    if (pickedImage != null) {
      return pickedImage(this);
    }
    return orElse();
  }
}

abstract class _ImagePicked implements FaceRestorationState {
  const factory _ImagePicked(final File image) = _$_ImagePicked;

  File get image;
  @JsonKey(ignore: true)
  _$$_ImagePickedCopyWith<_$_ImagePicked> get copyWith =>
      throw _privateConstructorUsedError;
}
