import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;

/// default compress sampai 1 MB
/// 1 MB = 1 000 000 Bytes
Future<XFile> compressImage(XFile file, {int toBytes = 1000000}) async {
  debugPrint('file Size: ${await file.length()}');
  try {
    if (await file.length() <= toBytes) {
      debugPrint('file result size: ${await file.length()}');
      return file;
    }

    final filePath = File(file.path).absolute.path;
    final outPath =
        '${path.dirname(filePath)}/${path.basenameWithoutExtension(filePath)}_out${path.extension(filePath)}';

    late CompressFormat format;

    switch (path.extension(filePath)) {
      case '.heic':
        format = CompressFormat.heic;
        break;
      case '.png':
        format = CompressFormat.png;
        break;
      case '.jpg':
        format = CompressFormat.jpeg;
        break;
      default:
        format = CompressFormat.jpeg;
    }

    final result = await FlutterImageCompress.compressAndGetFile(
      filePath,
      outPath,
      quality: 50,
      minHeight: 720,
      minWidth: 1280,
      format: format,
    );

    if (result != null) {
      return compressImage(result, toBytes: toBytes);
    }

    debugPrint('file result size: ${await file.length()}');
    return file;
  } catch (e) {
    debugPrint('file result size: ${await file.length()}');
    return file;
  }
}
