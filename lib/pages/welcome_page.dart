import 'dart:ui';

import 'package:flashcard_quiz_app/admin/admin_dashboard.dart';
import 'package:flashcard_quiz_app/pages/quiz_category.dart';
import 'package:flashcard_quiz_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
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
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Let's Play Quiz",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: whiteColor, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter Your Information \nBelow",
                ),
                const Spacer(),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 44, 32, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Full name",
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => QuizCategory());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: const BoxDecoration(
                        gradient: primaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text("Let's Start The Quiz",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color.fromARGB(255, 232, 182, 33))),
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AdminDashboard());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: const BoxDecoration(
                        gradient: primaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text("Admin",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color.fromARGB(255, 232, 182, 33))),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
