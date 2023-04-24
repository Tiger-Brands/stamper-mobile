import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoreboot/src/features/face_restoration/data/device/pick_image_services.dart';
import 'package:photoreboot/src/features/face_restoration/logic/cubit/face_restoration_cubit.dart';

@RoutePage()
class FaceRestorationScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const FaceRestorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaceRestorationCubit, FaceRestorationState>(
      builder: (BuildContext context, FaceRestorationState state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<FaceRestorationCubit>().pickImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: state.when(
                    failure: (reason) {
                      return null;
                    },
                    processing: () {
                      return null;
                    },
                    pickingImage: () {
                      return null;
                    },
                    pickedImage: (image) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Image.file(image),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black.withOpacity(.3),
                                  child: const Center(
                                    child: Text(
                                      'change image',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        //  fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton.icon(
                            icon: const Icon(Icons.model_training),
                            label: const Text('Run prediction'),
                            onPressed: () {
                              // run prediction here
                              context
                                  .read<FaceRestorationCubit>()
                                  .runPrediction(file: image);
                            },
                          )
                        ],
                      );
                    },
                    success: (data) {
                      return null;
                    },
                    initial: () {
                      return DottedBorder(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Center(
                            child: Text(
                              'click here to upload',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<FaceRestorationCubit>(
      create: (context) => FaceRestorationCubit(
        service: PickImageServices(),
      ),
      child: this,
    );
  }
}
