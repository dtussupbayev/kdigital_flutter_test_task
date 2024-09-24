import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/character_list_bloc.dart';
import 'package:kdigital_test/src/presentation/widgets/widgets.dart';

class CharacterListWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final CharacterListState state;

  CharacterListWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() => _onScroll(context));

    return ListView.builder(
      controller: _scrollController,
      itemCount: state.characters.length + 1,
      itemBuilder: (context, index) {
        if (index < state.characters.length) {
          return CharacterTileWidget(character: state.characters[index]);
        } else if (state.isPaginating) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoadingWidget(),
          );
        } else if (state.status == CharacterListStatus.nextPageUnsuccessful) {
          return FailureWidget(
            errorMessage: state.errorMessage ?? 'Error loading next page',
            onRetry: () => context
                .read<CharacterListBloc>()
                .add(RetryGetMoreCharacterListEvent()),
          );
        }
        return SizedBox();
      },
    );
  }

  void _onScroll(BuildContext context) {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      if (!state.isPaginating &&
          state.status != CharacterListStatus.nextPageUnsuccessful) {
        context.read<CharacterListBloc>().add(GetMoreCharacterListEvent());
      }
    }
  }
}
