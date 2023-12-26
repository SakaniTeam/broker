
 import 'package:path/path.dart';
// ignore: camel_case_types
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class images{
    Future<String> getImage() async {
    String imgUrl;
    File? file;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) file = File(image.path);

    var imagename = basename(image!.path);

    var refStorage = FirebaseStorage.instance.ref('products/$imagename');
    await refStorage.putFile(file!);
    imgUrl = await refStorage.getDownloadURL();

    return imgUrl;
  }

}