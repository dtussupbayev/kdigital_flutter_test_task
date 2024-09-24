part of 'character_list_bloc.dart';

sealed class CharacterListEvent extends Equatable {
  const CharacterListEvent();

  @override
  List<Object?> get props => [];
}

class GetCharacterListEvent extends CharacterListEvent {
  const GetCharacterListEvent();
}

class GetMoreCharacterListEvent extends CharacterListEvent {
  const GetMoreCharacterListEvent();
}

class RetryGetMoreCharacterListEvent extends CharacterListEvent {
  const RetryGetMoreCharacterListEvent();
}
