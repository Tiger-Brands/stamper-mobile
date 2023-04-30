import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);

  void toggle() => emit(true);
  void reset() => emit(false);

  @override
  bool fromJson(Map<String, dynamic> json) {
    return json['theme'] as bool;
  }

  @override
  Map<String, dynamic> toJson(bool state) {
    return <String, bool>{'theme': state};
  }
}
