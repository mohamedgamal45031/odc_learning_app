part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesLoading extends NotesState {}
class NotesLoaded extends NotesState {}
class NotesChanged extends NotesState {}
// class NotesInitial extends NotesState {}