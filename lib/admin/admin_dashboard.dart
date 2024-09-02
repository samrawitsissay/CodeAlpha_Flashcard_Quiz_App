import 'dart:ffi';

import 'package:flashcard_quiz_app/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final QuestionController questionController = Get.put(QuestionController());
  @override
  Void initState() {
    questionController.loadQuestionCategoryFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard "),
      ),
      body: GetBuilder<QuestionController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.savedCategories.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text(controller.savedCategories[index]),
                  subtitle: Text(controller.savedSubtitles[index]),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogBox,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  _showDialogBox() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 15),
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        title: "Add Quiz",
        content: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Enter the category name"),
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "Enter the category subtitle"),
            )
          ],
        ),
        textConfirm: "Create",
        textCancel: "Cancel",
        onConfirm: () {
          questionController.savedQuestionCategoryToSharedPrefrences();
          Get.back();
        });
  }
}
