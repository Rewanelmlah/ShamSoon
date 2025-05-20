import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:shamsoon/core/helpers/navigation.dart';

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}

enum ImageOperation{compress, crop}
enum CompressType{file, asset, bytes, network}

class ImageFactoryHelper {
  void makeOperation(ImageOperation operation){
    switch(operation){
      case ImageOperation.compress:
        compressImage(CompressType.file);
        break;
      case ImageOperation.crop:
        cropImage(image!.path);
        break;
    }
  }


  File? image;
  Future<File?> pickImage() async {
    return image ??= await Helpers.getImageFromCameraOrDevice();
  }

  Future<CroppedFile?> cropImage(String fileImagePath)async{
    return await ImageCropper().cropImage(
      compressFormat: ImageCompressFormat.png,
      sourcePath: fileImagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        WebUiSettings(
          context: Go.context,
        ),
      ],
    );
  }

  Future<void> compressImage(CompressType compressType)async{
    switch(compressType){
      case CompressType.file:
        await compressFileImage(image!.path);
        break;
      case CompressType.asset:
        await compressAssetImage(image!.path);
        break;
      case CompressType.bytes:
        await compressBytesFromMemory(image!.readAsBytesSync());
        break;
      case CompressType.network:
      // compressNetworkImage(image!.path);
        break;
    }
  }

  Future<Uint8List?> compressFileImage(String filePath)async{
    var result = await FlutterImageCompress.compressWithFile(
      filePath,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    log('the list is ${result.toString()}');
    return result;
  }

  Future<Uint8List?> compressAssetImage(String assetName)async{
    var list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 180,
    );

    log('the list is ${list.toString()}');
    return list;
  }

  Future<Uint8List> compressBytesFromMemory(Uint8List bytes) async {
    var result = await FlutterImageCompress.compressWithList(
      bytes,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    log('the list is ${result.toString()}');
    return result;
  }

  Image convertBytesToImage(Uint8List bytes){
    return Image.memory(bytes);
  }

  // Future<Uint8List> compressNetworkImage(String networkImagePath) async {
//   final dir = await getApplicationDocumentsDirectory();
//   final filePath = '${dir.path}/${networkImagePath.split("/").last}';
//
//   final response = await Dio().download(
//     networkImagePath,
//     filePath,
//     options: Options(
//       responseType: ResponseType.bytes
//     )
//   );
//
//   final bytes = (response.data as File).readAsBytesSync();
//   log('Image downloaded to: ${response.data}');
//   log('Image downloaded to: ${response.data.runtimeType}');
//   // var result = await FlutterImageCompress.compressWithList(
//   //   bytes,
//   //   minHeight: 1920,
//   //   minWidth: 1080,
//   //   quality: 96,
//   //   rotate: 135,
//   // );
//   return bytes;
// }
}

class ImageFactory extends StatefulWidget {
  const ImageFactory({super.key});
  const ImageFactory.get({super.key});
  const ImageFactory.process({super.key});

  @override
  State<ImageFactory> createState() => _ImageFactoryState();
}

class _ImageFactoryState extends State<ImageFactory> {
  final ImageFactoryHelper _helper = ImageFactoryHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Image Factory"),
      ),
      body: IconButton(
        onPressed: () {
          _helper.pickImage();
        },
          icon: Icon(Icons.add)
      ),
    );
  }
}
