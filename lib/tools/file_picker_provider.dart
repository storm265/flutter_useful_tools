import 'package:file_picker/file_picker.dart';

class FilePickerProvider {
  final _jpeg = 'jpeg';
  final _png = 'png';
  final _jpg = 'jpg';

  final _maxImageSizeMb = 3000 * 1024;
  final _maxFileSizeMb = 20000 * 1024;

  PlatformFile? _pickedFile;

  bool get _isPickedFile =>
      _pickedFile != null && _pickedFile!.extension != null;

  bool get isValidImage =>
      _isPickedFile && _pickedFile!.extension!.endsWith(_jpeg) ||
              _pickedFile!.extension!.endsWith(_png) ||
              _pickedFile!.extension!.endsWith(_jpg)
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
    );
    if (result != null) {
      _pickedFile = result.files.last;

      if (result.files.last.size >= _maxImageSizeMb) {
        result.files.clear();
        throw 'file is too huge';
      } else if (isValidImage) {
        return _pickedFile = result.files.last;
      } else {
        result.files.clear();
        throw 'wrong image, supported formats: .$_jpeg, .$_jpg, .$_png.';
      }
    }
    throw 'file not picked';
  }

  Future<PlatformFile> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      throw 'file not picked';
    } else if (result.files.last.size >= _maxFileSizeMb) {
      result.files.clear();
      throw 'file size is too huge';
    } else {
      return result.files.last;
    }
  }
}
