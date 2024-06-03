import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = StateNotifierProvider<ImagePickerNotifier, List<XFile>>((ref) {
  return ImagePickerNotifier();
});

class ImagePickerNotifier extends StateNotifier<List<XFile>> {
  ImagePickerNotifier() : super([]);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = [...state,pickedFile];
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      state = [...state,pickedFile];
    }
  }

  Future<void> pickMultipleImage() async{
    final List<XFile> xFileList = await _picker.pickMultiImage();
    if (xFileList.isNotEmpty){
      state =[...state,...xFileList];
    }
  }


}
