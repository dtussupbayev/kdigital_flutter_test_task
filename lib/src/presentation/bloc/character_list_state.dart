part of 'character_list_bloc.dart';

sealed class CharacterListState extends Equatable {}

class InitialCharacterListState extends CharacterListState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends CharacterListState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulCharacterListState extends CharacterListState {
  final String errorMessage;

  UnSuccessfulCharacterListState(this.errorMessage);

  @override
  List<Object> get props => [];
}

class SuccessfulCharacterListState extends CharacterListState {
  final List<Character> characters;

  SuccessfulCharacterListState(this.characters);

  @override
  List<Object> get props => [characters];
}
