import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_workshop/viewmodel/database/database.dart';


part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context) =>BlocProvider.of(context);

  String addNoteTime = " ";

  Future getTime() async{
    emit(NoteTimeLoading());
    DateTime now = DateTime.now();
    addNoteTime = now.toString();
    emit(NoteTimeLoaded());
  }

  Future addNote({required String title , required String date , required String description , }) async{
    emit(AddingNote());
    NotesDatabaseHelper.addNote(title, description, date);
    emit(NoteAdded());
  }

}