import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageProcessController {
  static Future uploadImage(BuildContext context, String directory) async {
    if (kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Reference ref = firebaseStorage.ref("/$directory").child(Uuid().v1());
        UploadTask uploadTask = ref.putData(result.files.single.bytes!,
            SettableMetadata(contentType: "image/png"));
        TaskSnapshot taskSnapshot = await uploadTask;
        taskSnapshot.ref
            .getDownloadURL()
            .then((value) => print("Completed : $value"))
            .catchError((error) => {
                  print("Completed : $error"),
                });
      }
    }else {
      var imagePicker = await UIUtils.pickImage();
      if (imagePicker != null) {
        String path = imagePicker.path;
        String name = imagePicker.name;
        Reference ref = firebaseStorage.ref("/$directory").child(Uuid().v1());
        UploadTask uploadTask = ref.putFile(File(path));
        TaskSnapshot taskSnapshot = await uploadTask;
        taskSnapshot.ref
            .getDownloadURL()
            .then((value) => print("Completed : $value"))
            .catchError((error) => {
          print("Completed : $error"),
        });
      }
    }

    /*if (kIsWeb) {
      Uint8List bytesFromPicker =
          await image_picker_web.ImagePickerWeb.getImage(outputType: image_picker_web.ImageType.bytes)
              as Uint8List;

      if (bytesFromPicker != null) {

      }
    } else {
      var imagePicker = await UIUtils.pickImage();

      if (imagePicker != null) {
        String path = imagePicker.path;
        String name = imagePicker.name;
        print("path : $path");
        print("name : $name");
        Reference ref = firebaseStorage.ref("/$directory").child(name);
        UploadTask uploadTask = ref.putFile(File(path));
        TaskSnapshot taskSnapshot = await uploadTask;
        taskSnapshot.ref
            .getDownloadURL()
            .then((value) => print("Completed : $value"))
            .catchError((error) => {
                  print("Completed : $error"),
                });
      }
    }*/
  }
}
