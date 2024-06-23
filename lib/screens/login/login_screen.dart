import 'package:flutter/material.dart';
import 'package:flutter_note/screens/list_notes/list_notes_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Username")),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 32),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(ListNotesScreen.route);
            }, child: Text("Log in"))
          ],
        ),
      ),
    );
  }
}
