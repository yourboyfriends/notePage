import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_note/screens/list_notes/list_notes_cubit.dart';

class NoteDetailScreen extends StatelessWidget {
  static const String route = "NoteDetailScreen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {
        return Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                "${state.notes[state.selectedIdx].dateTime.toIso8601String()}"),
            SizedBox(height: 16),
            Text("${state.notes[state.selectedIdx].title}"),
            SizedBox(height: 16),
            Text("${state.notes[state.selectedIdx].content}"),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  if (state.pageCount < 3) {
                    var cubit = context.read<ListNotesCubit>();
                    Navigator.of(context).pushNamed(EditNoteScreen.route,
                        arguments: {"cubit": cubit});
                  }
                },
                child: Text("Edit"))
          ]),
        );
      },
    );
  }
}
