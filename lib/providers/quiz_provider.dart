import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../models/question.dart';
import '../models/quiz_result.dart';

class QuizProvider extends ChangeNotifier {
  String playerName = '';
  String studentId = '';
  String studyProgram = '';
  int currentIndex = 0;
  final List<int?> _answers = List<int?>.filled(quizQuestions.length, null);
  bool isDarkMode = false;
  QuizResult? lastResult;

  List<Question> get questions => quizQuestions;
  int get totalQuestions => questions.length;
  Question get currentQuestion => questions[currentIndex];
  List<int?> get answers => List.unmodifiable(_answers);
  int get answeredCount => _answers.where((answer) => answer != null).length;
  double get progress => totalQuestions == 0 ? 0 : (currentIndex + 1) / totalQuestions;
  int get correctAnswers {
    var score = 0;
    for (var i = 0; i < questions.length; i++) {
      if (_answers[i] == questions[i].correctIndex) score++;
    }
    return score;
  }

  void setProfile({required String name, String nim = '', String program = ''}) {
    playerName = name.trim();
    studentId = nim.trim();
    studyProgram = program.trim();
    notifyListeners();
  }

  void setPlayerName(String name) {
    playerName = name.trim();
    notifyListeners();
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void selectAnswer(int index) {
    _answers[currentIndex] = index;
    notifyListeners();
  }

  bool get hasSelectedAnswer => _answers[currentIndex] != null;

  void nextQuestion() {
    if (currentIndex < totalQuestions - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }

  void finishQuiz() {
    lastResult = QuizResult(
      playerName: playerName.isEmpty ? 'Peserta' : playerName,
      correctAnswers: correctAnswers,
      totalQuestions: totalQuestions,
      answers: List<int?>.from(_answers),
    );
    notifyListeners();
  }

  void restartQuiz() {
    currentIndex = 0;
    for (var i = 0; i < _answers.length; i++) {
      _answers[i] = null;
    }
    lastResult = null;
    notifyListeners();
  }
}
