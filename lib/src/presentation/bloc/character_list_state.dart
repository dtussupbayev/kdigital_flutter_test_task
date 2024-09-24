part of 'character_list_bloc.dart';

enum CharacterListStatus { initial, loading, successful, unsuccessful, nextPageUnsuccessful }

class CharacterListState extends Equatable {
  final CharacterListStatus status;
  final List<Character> characters;
  final bool isPaginating;
  final bool isRetrying;
  final String? errorMessage;

  CharacterListState({
    required this.status,
    required this.characters,
    this.isPaginating = false,
    this.isRetrying = false,
    this.errorMessage,
  });

  factory CharacterListState.initial() {
    return CharacterListState(
      status: CharacterListStatus.initial,
      characters: [],
    );
  }

  CharacterListState copyWith({
    CharacterListStatus? status,
    List<Character>? characters,
    bool? isPaginating,
    bool? isRetrying,
    String? errorMessage,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      isPaginating: isPaginating ?? this.isPaginating,
      isRetrying: isRetrying ?? this.isRetrying,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, characters, isPaginating, isRetrying, errorMessage];
}
