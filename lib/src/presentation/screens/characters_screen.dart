import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kdigital_test/src/domain/use_cases/get_characters_use_case.dart';
import 'package:kdigital_test/src/presentation/bloc/character_list_bloc.dart';
import 'package:kdigital_test/src/presentation/widgets/widgets.dart';
import 'package:kdigital_test/src/service_locator/service_locator.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CharacterListBloc(
          InitialCharacterListState(),
          serviceLocator.get<GetCharactersUseCase>(),
        )..add(const GetCharacterListEvent(1)),
        child: BlocBuilder<CharacterListBloc, CharacterListState>(
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return LoadingWidget();
            } else if (state is SuccessfulCharacterListState) {
              return CharacterListWidget(state: state);
            } else if (state is UnSuccessfulCharacterListState) {
              return FailureWidget(errorMessage: state.errorMessage);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
