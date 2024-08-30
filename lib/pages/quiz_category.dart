import 'dart:ui';

import 'package:flashcard_quiz_app/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizCategory extends StatelessWidget {
  QuizCategory({super.key});
  final QuestionController _questionController = Get.put(QuestionController());

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
              itemCount: _questionController.savedCategories.length,
              itemBuilder: (context, index) {
                return Card(
                    child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.question_answer),
                      Text(_questionController.savedCategories[index]),
                      Text(_questionController.savedSubtitles[index])
                    ],
                  ),
                ));
              })
        ],
      ),
    );
  }
}
