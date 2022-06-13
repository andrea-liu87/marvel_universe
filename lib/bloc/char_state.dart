part of 'char_bloc.dart';

@immutable
abstract class CharState extends Equatable {
  @override
  List<Object> get props => [];
}

class CharInitial extends CharState {}

class CharLoading extends CharState {}

class CharLoaded extends CharState {
  final List<ComicChar> charsData;
  CharLoaded({required this.charsData});
}

class CharError extends CharState {
  final String message;
  CharError({required this.message});
}
