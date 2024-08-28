import 'dart:ui';

import 'package:flutter/material.dart';

class QuizCategory extends StatelessWidget {
  const QuizCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                    child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.question_answer),
                      Text('Quiz Title'),
                      Text("Quiz Subtitle")
                    ],
                  ),
                ));
              })
        ],
      ),
    );
  }
}
