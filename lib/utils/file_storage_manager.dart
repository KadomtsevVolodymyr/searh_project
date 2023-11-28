import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

enum ImageSection {
  noStoragePermission, // Permission denied, but not forever
  noStoragePermissionPermanent, // Permission denied forever
  browseFiles, // The UI shows the button to pick files
}

class FileStorageManager {
  FileStorageManager();

  Future<ImageSection> requestMediaPermission() async {
    PermissionStatus result;
    // In Android we need to request the storage permission,
    // while in iOS is the photos permission
    if (Platform.isAndroid) {
      result = await Permission.storage.request();
    } else {
      result = await Permission.photos.request();
    }

    ImageSection imageSection;
    if (result.isGranted) {
      imageSection = ImageSection.browseFiles;
    } else if (Platform.isIOS || result.isPermanentlyDenied) {
      imageSection = ImageSection.noStoragePermissionPermanent;
    } else {
      imageSection = ImageSection.noStoragePermission;
    }
    return imageSection;
  }
}
