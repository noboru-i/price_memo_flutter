import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/components/loading.dart';

class ImageView extends StatelessWidget {
  const ImageView(
    this.file, {
    Key? key,
  }) : super(key: key);

  final XFile? file;

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

    return const Center(
      child: Icon(Icons.image),
    );
  }
}
