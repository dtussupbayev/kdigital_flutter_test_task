import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/domain/use_cases/get_characters_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:equatable/equatable.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharacterListBloc(
    CharacterListState initialState,
    this.getCharactersUseCase,
  ) : super(initialState) {
    on<GetCharacterListEvent>(
      (event, emitter) => _getDataOnMainPageCasino(event, emitter),
    );
    on<DataLoadedCharacterListEvent>(
      (event, emitter) => _dataLoadedOnMainPageCasino(event, emitter),
    );
    on<LoadingCharacterListEvent>(
      (event, emitter) => emitter(LoadingMainPageState()),
    );
  }

  Future<void> _dataLoadedOnMainPageCasino(
    DataLoadedCharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    try {
      if (event.characters != null) {
        emit(SuccessfulCharacterListState(event.characters!));
      } else {
        emit(UnSuccessfulCharacterListState('No characters loaded'));
      }
    } catch (e) {
      emit(UnSuccessfulCharacterListState(e.toString()));
    }
  }

  Future<void> _getDataOnMainPageCasino(
    GetCharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    try {
      emit(LoadingMainPageState());
      final charactersResult = await getCharactersUseCase.execute(event.page);
      if (charactersResult.status == ApiResultStatus.success) {
        add(DataLoadedCharacterListEvent(charactersResult.data!));
      } else {
        emit(UnSuccessfulCharacterListState(charactersResult.errorMessage!));
      }
    } catch (e) {
      emit(UnSuccessfulCharacterListState(e.toString()));
    }
  }
}
