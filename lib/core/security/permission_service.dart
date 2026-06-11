import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestCamera() async {
    PermissionStatus status =
    await Permission.camera.request();

    return status.isGranted;
  }
}