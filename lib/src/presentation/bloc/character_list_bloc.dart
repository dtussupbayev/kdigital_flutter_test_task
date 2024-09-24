import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/domain/use_cases/get_characters_use_case.dart';
import 'package:kdigital_test/src/data/models/character.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final GetCharactersUseCase getCharactersUseCase;
  int _currentPage = 1;
  bool _isFetching = false;

  CharacterListBloc(this.getCharactersUseCase)
      : super(CharacterListState.initial()) {
    on<GetCharacterListEvent>(_onGetInitialCharacters);
    on<GetMoreCharacterListEvent>(_onGetMoreCharacters);
    on<RetryGetMoreCharacterListEvent>(_onRetryGetMoreCharacters);
  }

  Future<void> _onGetInitialCharacters(
    GetCharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    emit(state.copyWith(status: CharacterListStatus.loading));
    await _fetchCharacters(emit);
  }

  Future<void> _onGetMoreCharacters(
    GetMoreCharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    if (_isFetching || state.isPaginating) return;
    _isFetching = true;
    emit(state.copyWith(isPaginating: true));

    await _fetchCharacters(emit, isLoadMore: true);
    _isFetching = false;
  }

  Future<void> _onRetryGetMoreCharacters(
    RetryGetMoreCharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    if (_isFetching) return;
    _isFetching = true;
    emit(state.copyWith(isRetrying: true));

    await _fetchCharacters(emit, isLoadMore: true);
    _isFetching = false;
  }

  Future<void> _fetchCharacters(
    Emitter<CharacterListState> emit, {
    bool isLoadMore = false,
  }) async {
    try {
      final charactersResult = await getCharactersUseCase.execute(_currentPage);
      if (charactersResult.status == ApiResultStatus.success) {
        final characters = charactersResult.data!;
        emit(state.copyWith(
          status: CharacterListStatus.successful,
          characters: [...state.characters, ...characters],
          isPaginating: false,
          isRetrying: false,
        ));
        _currentPage++;
      } else {
        _handleErrorState(emit, charactersResult.errorMessage!, isLoadMore);
      }
    } catch (e) {
      _handleErrorState(emit, e.toString(), isLoadMore);
    }
  }

  void _handleErrorState(
    Emitter<CharacterListState> emit,
    String errorMessage,
    bool isLoadMore,
  ) {
    emit(state.copyWith(
      status: isLoadMore
          ? CharacterListStatus.nextPageUnsuccessful
          : CharacterListStatus.unsuccessful,
      errorMessage: errorMessage,
      isPaginating: false,
      isRetrying: false,
    ));
  }
}
