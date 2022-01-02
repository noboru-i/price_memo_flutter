import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/components/loading.dart';

class ImageView extends StatelessWidget {
  const ImageView(
    this.file,
    this.imageData, {
    Key? key,
  }) : super(key: key);

  final XFile? file;
  final AsyncValue<Uint8List?>? imageData;

  @override
  Widget build(BuildContext context) {
    final localFile = file;
    if (localFile != null) {
      return FutureBuilder<Uint8List>(
        future: localFile.readAsBytes(),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const MyLoading();
          }
          return Image.memory(snapshot.data!);
        },
      );
    }
    final localImageData = imageData;
    if (localImageData != null) {
      return localImageData.when(
        data: (data) => data != null ? Image.memory(data) : const Text('error'),
        error: (_, __) => const Text('error'),
        loading: () => const MyLoading(),
      );
    }

    return const Center(
      child: Icon(Icons.image),
    );
  }
}
