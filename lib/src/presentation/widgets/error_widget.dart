import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/character_list_bloc.dart';

class FailureWidget extends StatelessWidget {
  final String errorMessage;
  const FailureWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error: ${errorMessage}"),
          ElevatedButton(
            onPressed: () {
              context.read<CharacterListBloc>().add(GetCharacterListEvent(1));
            },
            child: Text('Retry'),
          )
        ],
      ),
    );
  }
}
