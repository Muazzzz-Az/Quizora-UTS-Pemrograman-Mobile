class QuizResult {
  final String playerName;
  final int correctAnswers;
  final int totalQuestions;
  final List<int?> answers;

  const QuizResult({
    required this.playerName,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.answers,
  });

  int get score => totalQuestions == 0 ? 0 : (correctAnswers * 100 / totalQuestions).round();
}
