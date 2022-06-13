import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_universe/model/comic_char.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'char_repository.dart';

part 'char_events.dart';
part 'char_state.dart';

class CharBloc extends Bloc<CharEvents, CharState> {
  final CharRepository _charRepository;
  CharBloc(this._charRepository) : super(CharInitial()) {
    on<CharEvents>((event, emit) async {
      try {
        emit(CharLoading());
        List<ComicChar> data = await _charRepository.fetchAllChar();
        emit(CharLoaded(charsData: data));
      } on Exception {
        emit(CharError(message: "Couldn't fetch the list, please try again later!"));
      }
    });
  }
}