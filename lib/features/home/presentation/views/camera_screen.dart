import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/home/presentation/views/prediction_screen.dart';
class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  XFile? _capturedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  void initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras![0], ResolutionPreset.medium);
    await _cameraController!.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  void captureImage() async {
    if (_cameraController != null) {
      XFile image = await _cameraController!.takePicture();
      setState(() {
        _capturedImage = image;
      });
    }
  }

  void pickImageFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _capturedImage = image;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Camera',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: Column(
          children: [
            Expanded(
              child: _isCameraInitialized
                  ? SizedBox(
                      width: double.infinity,  
                      height: 0.4.sh,  
                      child: Stack(
                        children: [
                          CameraPreview(_cameraController!),
                          Center(
                            child: Container(
                              width: 0.50.sw,  // 45% of screen width
                              height: 0.50.sw,  
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.w),  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo_outlined, size: 50.sp, color: AppColors.primaryColor),
                    onPressed: pickImageFromGallery,
                  ),
                  IconButton(
                    icon: Icon(Icons.radio_button_checked_outlined, size: 60.sp, color: AppColors.primaryColor),
                    onPressed: captureImage,
                  ),
                  IconButton(
                    icon: Icon(Icons.check_circle, size: 50.sp, color: AppColors.primaryColor),
                    onPressed: () {
                      if (_capturedImage != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PredictionScreen(imagePath: _capturedImage!.path),
                         ),
                       );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),  
          ],
        ),
      ),
    );
  }
}