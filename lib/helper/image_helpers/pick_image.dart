import 'package:image_picker/image_picker.dart';

void pickImage({
  void Function(XFile imagePicked)? onImagePicked,
}) async {
  try {
    XFile? result;
    bool fromCamera = true;

    // TODO pilihan gallery/kamera

    // TODO loading

    final ImagePicker picker = ImagePicker();
    result = await picker.pickImage(
      // ignore: dead_code
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (result != null) {
      // TODO compress
      // result = await compressImage(result, toBytes: 500000);

      // TODO dismiss loading
      onImagePicked?.call(result);
    } else {
      // TODO dismiss loading
    }
  } catch (e) {
    // TODO dismiss loading
    // TODO show error
  }
}
