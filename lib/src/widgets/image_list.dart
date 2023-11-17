import 'package:flutter/material.dart';
import 'package:image_generator/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> imagens;
  const ImageList(this.imagens);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagens.length,
      itemBuilder: ((context, index) {
        return Stack(alignment: Alignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 10),
            child: Image.network(
              imagens[index].url,
              width: 640,
              height: 360,
            ),
          )
        ]);
      }),
    );
  }
}
