part of 'character_list_bloc.dart';

sealed class CharacterListEvent extends Equatable {
  const CharacterListEvent();

  @override
  List<Object?> get props => [];
}

class GetCharacterListEvent extends CharacterListEvent {
  final int page;

  const GetCharacterListEvent(this.page);

  @override
  List<Object?> get props => [];
}

class LoadingCharacterListEvent extends CharacterListEvent {
  const LoadingCharacterListEvent();

  @override
  List<Object?> get props => [];
}

class DataLoadedCharacterListEvent extends CharacterListEvent {
  final List<Character>? characters;

  const DataLoadedCharacterListEvent(this.characters);

  @override
  List<Object?> get props => [characters];
}
