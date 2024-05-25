import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission(int permissionType) async {
  Permission permission = Permission.byValue(permissionType);
  if (await permission.isDenied) await permission.request();
  if (await permission.isPermanentlyDenied) await openAppSettings();
  return permission.isGranted;
}
