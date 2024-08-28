class Question {
  final int id;
  final String questions;
  final String category;
  final List<String> options;
  final int answer;

  Question({
    required this.id,
    required this.category,
    required this.answer,
    required this.options,
    required this.questions,
  });
  Map<String, dynamic> toJson() {
    return {
      " Category": category,
      "id": id,
      "questions": questions,
      "options": options,
      "answer": answer,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      category: json["category"],
      answer: json["answer"],
      options: json["options"],
      questions: json["questions"],
    );
  }
}
