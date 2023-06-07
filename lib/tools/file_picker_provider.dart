import 'package:file_picker/file_picker.dart';

const _jpeg = 'jpeg';
const _png = 'png';
const _jpg = 'jpg';

class FileProvider {
  PlatformFile? pickedFile;

  final _maxImageSize = 3000 * 1024; // 3mb
  final _maxFileSize = 26000 * 1024; // 26mb

  bool get _isPickedImage =>
      pickedFile != null && pickedFile!.extension != null;

  bool get isValidImage =>
      _isPickedImage && pickedFile!.extension!.endsWith(_jpeg) ||
              pickedFile!.extension!.endsWith(_png) ||
              pickedFile!.extension!.endsWith(_jpg)
          ? true
          : false;

  Future<PlatformFile> pickAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowCompression: true,
          type: FileType.custom,
          allowedExtensions: [
            _jpeg,
            _png,
            _jpg,
          ],
        ) ??
        const FilePickerResult([]);
    pickedFile = result.files.last;

    if (result.files.last.size >= _maxImageSize) {
      result.files.clear();
      throw 'file is too huge';
    } else if (isValidImage) {
      return pickedFile = result.files.last;
    } else {
      result.files.clear();
      throw 'wrong image, supported formats: .$_jpeg, .$_jpg, .$_png.';
    }
  }

  Future<PlatformFile> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.last.size >= _maxFileSize) {
      result.files.clear();
      throw 'file size is too huge';
    } else {
      PlatformFile file = result!.files.last;
      return file;
    }
  }
}
