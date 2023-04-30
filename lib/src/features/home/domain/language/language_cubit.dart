import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<String> {
  LanguageCubit() : super('en');

  void setLocale(String locale) => emit(locale);

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['locale'] as String;
  }

  @override
  Map<String, dynamic> toJson(String state) {
    return <String, String>{'locale': state};
  }
}
