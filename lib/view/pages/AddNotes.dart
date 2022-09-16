import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odc_workshop/view/components/core/components.dart';
import 'package:odc_workshop/view/pages/notes.dart';
import 'package:odc_workshop/viewmodel/bloc/add_note_cubit.dart';
import '../../viewmodel/bloc/notes_cubit.dart';
import '../components/core/constants.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);
  GlobalKey<FormState> addNoteFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title: const Text('Add Note',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is NoteAdded) {
            AddNoteCubit.get(context).getTime();
          }
        },
        builder: (context, state) {
          AddNoteCubit addNoteCubit = AddNoteCubit.get(context);

          var descriptionController = TextEditingController();
          var dateController = TextEditingController();
          dateController.text = addNoteCubit.addNoteTime;
          var titleController = TextEditingController();
          return MediaQuery(
            data: const MediaQueryData(),
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 20,
                  0,
                  MediaQuery.of(context).size.width / 20,
                  MediaQuery.of(context).size.height / 40),
              child: (state is NotesLoaded)
                  ? Center(
                child: LoadingAnimationWidget.prograssiveDots(
                  color: mainColor,
                  size: MediaQuery.of(context).size.width / 10,
                ),
              )
                  : SingleChildScrollView(
                child: Form(
                  key: addNoteFormKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30,
                            left: MediaQuery.of(context).size.width / 60,
                            bottom:
                            MediaQuery.of(context).size.height / 100),
                      ),
                      defaultFormField(
                        decoration: decoration(label: "Title",context:  context,color: Colors.blue, borders: 0),
                        controller: titleController =
                            TextEditingController(),
                        type: TextInputType.text,
                        isPassword: false,
                      ),
                      getSizedBox(context),
                      defaultFormField(
                        decoration: decoration(label: "Date", context: context ,color: Colors.blue , borders: 0 ),
                        controller: dateController,
                        type: TextInputType.text,
                        isPassword: false,
                      ),
                      getSizedBox(context),
                      defaultFormField(
                        minLines: 7,
                        decoration: decoration(label: "Description", context: context,color: Colors.blue ,borders:  0 ),
                        controller: descriptionController =
                            TextEditingController(),
                        type: TextInputType.text,
                        isPassword: false,
                      ),
                      (state is AddingNote)
                          ? Center(
                        child:
                        LoadingAnimationWidget.prograssiveDots(
                          color: mainColor,
                          size: MediaQuery.of(context).size.width /
                              10,
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 3,
                            MediaQuery.of(context).size.height / 20,
                            MediaQuery.of(context).size.width / 3,
                            0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (addNoteFormKey.currentState!
                                  .validate()) {
                                addNoteCubit.addNote(
                                    title: titleController.text,
                                    date: dateController.text,
                                    description:
                                    descriptionController.text);
                                NotesCubit().refreshData();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext
                                        context) =>
                                        const Notes()));
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                Center(child: Text("Add")),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}