import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odc_workshop/view/components/core/components.dart';
import 'package:odc_workshop/view/components/core/constants.dart';
import '../../viewmodel/bloc/notes_cubit.dart';
import 'AddNotes.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[100],
          elevation: 2,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext
                    context) =>
                        AddNote()));
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {

              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title:  Text('Notes',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black
            )),
      ),
      body: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          NotesCubit notesCubit = NotesCubit.get(context)..getNotes();
          return (state is NotesLoading)
              ? getSizedBox(context)
              : (notesCubit.notes.isEmpty)
              ? const Center(
            child: Text(
              'There\'s No Data To Show',
              style: TextStyle(fontSize: 18),
            ),
          )
              : ListView.builder(
            itemCount: notesCubit.notes.length,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                child: ListTile(
                  leading:  Icon(
                    Icons.note,
                    color: mainColor,
                  ),
                  title: Text(notesCubit.notes[index].title!),
                  subtitle:
                  Text(notesCubit.notes[index].description!),
                ),
              );
            },
          );
        },
      ),
    );
  }

}