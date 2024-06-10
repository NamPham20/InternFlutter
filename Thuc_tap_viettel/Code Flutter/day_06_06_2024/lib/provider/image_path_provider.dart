import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePathProvider extends StateNotifier<XFile?>{
  ImagePathProvider() :super(null) ;

  Future<XFile?> stringToXFile(String base64String) async {
    List<int> bytes = base64Decode(base64String);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/temp_image.png');
    await tempFile.writeAsBytes(bytes);
    return XFile(tempFile.path);
  }

}

final imagePathProvider = StateNotifierProvider<ImagePathProvider,XFile?>((ref) {
  return ImagePathProvider();
});