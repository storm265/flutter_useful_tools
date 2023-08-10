import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_useful_tools/data_source_classes/firebase_cloud/remote_storage_data_source.dart';

class RemoteStorageDataSourceImpl implements RemoteStorageDataSource {
  final FirebaseStorage _firebaseStorage;

  RemoteStorageDataSourceImpl({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  final _imageFolder = 'avatars/';

  @override
  Future<String> uploadAvatarToStorage({
    required String fileName,
    required String filePath,
  }) async {
    final ref = _firebaseStorage.ref('$_imageFolder$fileName');
    final uploader = await ref.putFile(File(filePath));
    final url = await uploader.ref.getDownloadURL();
    return url;
  }

  @override
  Future<void> deleteFile({required String url}) =>
      _firebaseStorage.refFromURL(url).delete();
}
