abstract class RemoteStorageDataSource {
  Future<String> uploadAvatarToStorage({
    required String fileName,
    required String filePath,
  });

  Future<void> deleteFile({required String url});
}
