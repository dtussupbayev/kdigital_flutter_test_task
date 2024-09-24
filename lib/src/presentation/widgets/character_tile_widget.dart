import 'package:flutter/material.dart';
import 'package:kdigital_test/src/data/models/character.dart';

import 'image_loading_widget.dart';

class CharacterTileWidget extends StatelessWidget {
  final Character character;

  const CharacterTileWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(character.name),
            ),
            Image.network(
              character.image,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null ? child : ImageLoadingWidget();
              },
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
