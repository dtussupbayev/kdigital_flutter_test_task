import 'package:flutter/material.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:kdigital_test/src/presentation/widgets/character_tile_widget.dart';

class CharacterListWidget extends StatelessWidget {
  final SuccessfulMainPageState state;
  const CharacterListWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: double.infinity,
      itemCount: state.characters.length,
      itemBuilder: (context, index) {
        return CharacterTileWidget(
          character: state.characters[index],
        );
      },
    );
  }
}
