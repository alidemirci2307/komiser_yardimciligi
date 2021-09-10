import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageProcessController {
  static Future<String?> uploadImage(BuildContext context, String directory) async {
    String? fileURL;
    if (kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Reference ref = firebaseStorage.ref("/$directory").child(Uuid().v1());
        UploadTask uploadTask = ref.putData(result.files.single.bytes!);
        TaskSnapshot taskSnapshot = await uploadTask;
        await taskSnapshot.ref
            .getDownloadURL()
            .then((value) => fileURL = value)
            .catchError((error) =>
                  print("Completed : $error"),
                );
      }
    }else {
      var imagePicker = await UIUtils.pickImage();
      if (imagePicker != null) {
        String path = imagePicker.path;
        Reference ref = firebaseStorage.ref("/$directory").child(Uuid().v1());
        UploadTask uploadTask = ref.putFile(File(path));
        TaskSnapshot taskSnapshot = await uploadTask;
        await taskSnapshot.ref
            .getDownloadURL()
            .then((value) => fileURL=value)
            .catchError((error) =>
          print("Completed : $error"),
        );
      }
    }
    print("Firebase uploaded URL : $fileURL");
    return fileURL;
  }
}
