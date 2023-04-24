import 'package:image_picker/image_picker.dart';

class PickImageServices {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      return pickedFile!.path;
    } catch (err) {
      return null;
    }
  }
}
