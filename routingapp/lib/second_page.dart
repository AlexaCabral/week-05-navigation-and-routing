import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String? text;
  const SecondPage({this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("This is the second page"),
      ),
      body: Column(
        children: [
          Text(text ?? "No text passed"),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "I'm back");
              },
              child: Text("Go back"))
        ],
      ),
    );
  }
}
