import 'dart:io' show File;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoreboot/src/data/models/gfpgan_prediction.dart';
import 'package:photoreboot/src/features/face_restoration/data/api/replica_services.dart';
import 'package:photoreboot/src/features/face_restoration/data/device/pick_image_services.dart';
part 'face_restoration_state.dart';
part 'face_restoration_cubit.freezed.dart';

class FaceRestorationCubit extends Cubit<FaceRestorationState> {
  FaceRestorationCubit({required this.service})
      : super(
          const FaceRestorationState.initial(),
        );
  final PickImageServices service;

  Future<void> pickImage() async {
    emit(const FaceRestorationState.pickingImage());
    final image = await service.pickImage(ImageSource.gallery);
    if (image != null) {
      final file = File(image);
      emit(FaceRestorationState.pickedImage(file));
    } else {
      emit(const FaceRestorationState.failure(reason: 'No image selected'));
    }
  }

  Future<void> runPrediction({required File file}) async {
    final service = ReplicaServices();
    await service.predict(image: file);
  }
}
