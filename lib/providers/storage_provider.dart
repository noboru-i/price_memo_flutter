import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/providers/provider.dart';
import 'package:image/image.dart';

class StorageRepository {
  StorageRepository(this._reader);

  final Reader _reader;

  UploadTask? currentTask;

  Future<TaskSnapshot> uploadImage(XFile file) async {
    try {
      final image = await _compress(file);

      Reference reference =
          _reader(storageProvider).ref().child('products').child(file.name);

      final metadata = SettableMetadata(
          contentType: file.mimeType,
          customMetadata: {'picked-file-path': file.path});

      final uploadTask = reference.putData(image, metadata);
      currentTask = uploadTask;

      final task = await uploadTask;

      return task;
    } catch (e) {
      // TODO error check
      rethrow;
    }
  }

  void cancelCurrentTask() {
    currentTask?.cancel();
  }
}

Future<Uint8List> _compress(XFile file) async {
  final image = decodeImage(await file.readAsBytes());
  if (image == null) {
    throw Error();
  }

  final isWidthLarger = image.width > image.height;
  return Uint8List.fromList(encodeJpg(copyResize(
    image,
    width: isWidthLarger ? 640 : null,
    height: isWidthLarger ? null : 640,
  )));
}
