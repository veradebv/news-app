import 'package:flutter/material.dart';

class AddMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Folder"),
        backgroundColor: Color(0xFF138880),
      ),
      body: Center(
        child: Text(
          "This is the Add Folder screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
