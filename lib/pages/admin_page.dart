import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final String quizCategory;
  const AdminPage({super.key, required this.quizCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Question to $quizCategory"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Question"),
          ),
          for (var i = 0; i < 4; i++)
            TextFormField(
              decoration: InputDecoration(labelText: "Options ${i + 1}"),
            ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Correct Answers (0-3)"),
          ),
        ],
      ),
    );
  }
}
