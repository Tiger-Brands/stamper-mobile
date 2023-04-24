part of 'face_restoration_cubit.dart';

@freezed
class FaceRestorationState with _$FaceRestorationState {
  const factory FaceRestorationState.initial() = _Initial;
  const factory FaceRestorationState.processing() = _Processing;
  const factory FaceRestorationState.success({
    required GfpganPrediction prediction,
  }) = _Success;
  const factory FaceRestorationState.failure({required String reason}) =
      _Failure;
  const factory FaceRestorationState.pickingImage() = _ImagePicking;
  const factory FaceRestorationState.pickedImage(File image) = _ImagePicked;
}
