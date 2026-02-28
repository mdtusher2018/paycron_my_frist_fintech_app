import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';

class SelfieCameraScreen extends StatefulWidget {
  static late List<CameraDescription> cameras;

  const SelfieCameraScreen({super.key});
  @override
  State<SelfieCameraScreen> createState() => _SelfieCameraScreenState();
}

class _SelfieCameraScreenState extends State<SelfieCameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeCameraFuture;
  int _cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    if (SelfieCameraScreen.cameras.isNotEmpty) {
      _cameraController = CameraController(
        SelfieCameraScreen.cameras[_cameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeCameraFuture = _cameraController.initialize();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _navigatePage(XFile image) {}

  Future<void> _takePicture() async {
    await _initializeCameraFuture;
    final XFile image = await _cameraController.takePicture();
    _navigatePage(image);
  }

  void _switchCamera() {
    _cameraIndex = (_cameraIndex + 1) % SelfieCameraScreen.cameras.length;
    _cameraController.dispose();
    _initCamera();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder(
            future: _initializeCameraFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),

          Positioned(
            top: 50.h,
            left: 16.w,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconButton(Icons.cameraswitch, _switchCamera),
                _captureButton(_takePicture),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22.r,
        backgroundColor: Colors.black.withOpacity(0.45),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _captureButton(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Center(
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
