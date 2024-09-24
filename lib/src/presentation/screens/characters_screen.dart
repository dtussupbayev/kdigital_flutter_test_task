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
          serviceLocator.get<GetCharactersUseCase>(),
        )..add(const GetCharacterListEvent()),
        child: BlocBuilder<CharacterListBloc, CharacterListState>(
          builder: (blocContext, state) {
            if (state.status == CharacterListStatus.loading) {
              return LoadingWidget();
            } else if (state.status == CharacterListStatus.successful) {
              return CharacterListWidget(state: state);
            } else if (state.status ==
                CharacterListStatus.nextPageUnsuccessful) {
              return CharacterListWidget(state: state);
            } else if (state.status == CharacterListStatus.unsuccessful) {
              return FailureWidget(
                errorMessage: state.errorMessage ?? 'Unknown error',
                onRetry: () => blocContext
                    .read<CharacterListBloc>()
                    .add(GetCharacterListEvent()),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
