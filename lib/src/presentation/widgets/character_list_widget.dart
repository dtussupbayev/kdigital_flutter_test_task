import 'package:flutter/material.dart';
import 'package:kdigital_test/src/presentation/bloc/character_list_bloc.dart';

import 'character_tile_widget.dart';

class CharacterListWidget extends StatelessWidget {
  final SuccessfulCharacterListState state;
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
