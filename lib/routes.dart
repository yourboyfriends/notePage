import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_note/screens/list_notes/list_notes_cubit.dart';
import 'package:flutter_note/screens/list_notes/list_notes_screen.dart';
import 'package:flutter_note/screens/login/login_screen.dart';
import 'package:flutter_note/screens/note_detail/note_detail_screen.dart';


Route<dynamic>? mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case ListNotesScreen.route:
      return MaterialPageRoute(builder: (context) => ListNotesScreen(),
      settings: RouteSettings(name: ListNotesScreen.route));
    case NoteDetailScreen.route:
      var cubit = (settings.arguments as Map<String, dynamic>)['cubit'] as ListNotesCubit;
      return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: Scaffold(body: NoteDetailScreen()),
              ));
    case EditNoteScreen.route:
      var cubit = (settings.arguments as Map<String, dynamic>)['cubit'] as ListNotesCubit;
      var isAddMode = false;
      if ((settings.arguments as Map<String, dynamic>)['isAddMode'] != null)
        isAddMode = (settings.arguments as Map<String, dynamic>)['isAddMode'] as bool;
      return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: Scaffold(
                    body: EditNoteScreen(
                  isAddMode: isAddMode,
                  oldPageCount: cubit.state.pageCount,
                )),
              ));
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
