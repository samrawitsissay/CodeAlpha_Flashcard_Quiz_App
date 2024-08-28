import 'package:flashcard_quiz_app/models/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionController extends GetxController {
  final List<Question> _questions = [];
  List<Question> get questions => _questions;
  //admin Dashboard
  final String _categorykey = "category_title";
  final String _subtitlekey = "subtitle";
  TextEditingController categoryTitleController = TextEditingController();
  TextEditingController categorySubtitleController = TextEditingController();
  RxList<String> savedCategories = <String>[].obs;
  RxList<String> savedSubtitles = <String>[].obs;

  void savedQuestionCategoryToSharedPrefrences() async {
    final prefs = await SharedPreferences.getInstance();
    savedCategories.add(categoryTitleController.text);
    savedSubtitles.add(categorySubtitleController.text);
    await prefs.setStringList(_categorykey, savedCategories);
    await prefs.setStringList(_subtitlekey, savedSubtitles);

    categorySubtitleController.clear();
    categoryTitleController.clear();
    Get.snackbar("Saved", "Category created successfully");
  }

  void loadQuestionCategoryFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final catagories = prefs.getStringList(_categorykey) ?? [];
    final subtitles = prefs.getStringList(_subtitlekey) ?? [];

    savedCategories.assignAll(catagories);
    savedSubtitles.assignAll(subtitles);
    update();
  }
}
