
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';


class TFireBaseStorageService extends GetxService {
  static TFireBaseStorageService get instance => Get.find();

 final _firebaseStorage = FirebaseStorage.instance;

 ///upload local assets from IDE
  ///Returns a Uint8List containing image data.

 Future<Uint8List> getImageDataFromAssets(String path) async {
   try {
     final byteData = await rootBundle.load(path);
     final imageData = byteData.buffer.asUint8List(
         byteData.offsetInBytes, byteData.lengthInBytes);
     return imageData;
   } on PlatformException catch (e) {
     throw TPlatformException(e.code).message;
   } catch (e) {
     throw "Something went wrong. Please try again";
   }
 }
  ///Function to upload image to firebase storage
  Future<String> uploadImageData(String path ,Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);

      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  ///Upload Image on Cloud Firebase Storage
/// Returns the download URL of the uploaded image.
Future<String> uploadImageFile(String path, XFile image) async {
   try {
     final ref = _firebaseStorage.ref(path).child(image.name);
     await ref.putFile(File(image.path));
     final url = await ref.getDownloadURL();
     return url;
   } on FirebaseException catch (e) {
     throw TFirebaseException(e.code).message;
   } on FormatException {
     throw const TFormatException();
   } on PlatformException catch (e) {
     throw TPlatformException(e.code).message;
   } catch (e) {
     throw "Something went wrong. Please try again";
   }
}


  ///Function to delete image from firebase storage
  // Future<void> deleteImage(String path) async {
  //   try {
  //     final ref = _firebaseStorage.ref().child(path);
  //     await ref.delete();
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw "Something went wrong. Please try again";
  //   }
  // }
}