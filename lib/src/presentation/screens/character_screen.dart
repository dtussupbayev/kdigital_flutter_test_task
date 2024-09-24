import 'package:kdigital_test/src/data/repository/characters_repository.dart';
import 'package:kdigital_test/src/service_locator/service_locator.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/widgets/character_list_widget.dart';
import 'package:kdigital_test/src/presentation/widgets/loading_widget.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          InitialMainPageState(),
          serviceLocator.get<CharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return LoadingWidget();
            } else if (state is SuccessfulMainPageState) {
              return CharacterListWidget(state: state);
            } else {
              return Center(child: const Text("error"));
            }
          },
        ),
      ),
    );
  }
}
