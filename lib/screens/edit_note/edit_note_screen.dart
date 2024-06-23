import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/screens/list_notes/list_notes_screen.dart';
import '../list_notes/list_notes_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  static const String route = "EditNoteScreen";
  final isAddMode;
  final oldPageCount;

  const EditNoteScreen({this.isAddMode = false, required this.oldPageCount});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {
        var _title = TextEditingController(text: "");
        var _content = TextEditingController(text: "");
        var cubit = context.read<ListNotesCubit>();
        if (!isAddMode) {
          _title.text = state.notes[state.selectedIdx].title;
          _content.text = state.notes[state.selectedIdx].content;
        }
        var newPageCount = state.pageCount;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${isAddMode ? "Add" : "Edit"}"),
              SizedBox(height: 16),
              TextField(controller: _title),
              SizedBox(height: 16),
              TextField(
                controller: _content,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if (!isAddMode) {
                      cubit.editNote(
                        state.selectedIdx,
                        _title.text,
                        _content.text,
                      );
                      if (oldPageCount < 3) {
                        //3 don't need back
                        if (oldPageCount == newPageCount)
                          Navigator.of(context).pop();
                        else
                          Navigator.of(context).popUntil(
                              ModalRoute.withName(ListNotesScreen.route));
                      }
                    } else {
                      cubit.addNote(_title.text, _content.text);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Save"))
            ],
          ),
        );
      },
    );
  }
}
