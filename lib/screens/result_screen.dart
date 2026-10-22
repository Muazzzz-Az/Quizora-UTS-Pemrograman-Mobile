import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final result = quiz.lastResult;
    final score = result?.score ?? 0;
    final correct = result?.correctAnswers ?? 0;
    final total = result?.totalQuestions ?? quiz.totalQuestions;
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width > 600 ? width * .18 : 22.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil kuis', style: TextStyle(fontWeight: FontWeight.w900))),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(horizontal, 14, horizontal, 28),
              child: Column(
                children: [
                  Container(
                    width: 112, height: 112,
                    decoration: BoxDecoration(
                      color: AppTheme.violet.withValues(alpha: .12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(score >= 70 ? Icons.emoji_events_rounded : Icons.school_rounded,
                      color: AppTheme.violet, size: 58),
                  ),
                  const SizedBox(height: 20),
                  Text(_greeting(score), style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900), textAlign: TextAlign.center),
                  const SizedBox(height: 6),
                  Text('Kerja bagus, ${result?.playerName ?? quiz.playerName}!',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 16)),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text('$score', style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, height: 1)),
                          const Text('DARI 100 POIN', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w800, fontSize: 11)),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              Expanded(child: _stat(context, Icons.check_circle_rounded, '$correct', 'Benar', AppTheme.teal)),
                              Container(width: 1, height: 48, color: Theme.of(context).colorScheme.outlineVariant),
                              Expanded(child: _stat(context, Icons.cancel_rounded, '${total - correct}', 'Salah', Colors.deepOrange)),
                              Container(width: 1, height: 48, color: Theme.of(context).colorScheme.outlineVariant),
                              Expanded(child: _stat(context, Icons.quiz_rounded, '$total', 'Soal', AppTheme.violet)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(alignment: Alignment.centerLeft, child: Text('Review jawaban',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900))),
                  const SizedBox(height: 12),
                  ...List.generate(quiz.questions.length, (index) {
                    final question = quiz.questions[index];
                    final answer = result?.answers[index];
                    final isCorrect = answer == question.correctIndex;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                              color: isCorrect ? AppTheme.teal : Colors.deepOrange),
                            const SizedBox(width: 10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${index + 1}. ${question.prompt}', style: const TextStyle(fontWeight: FontWeight.w800)),
                                const SizedBox(height: 6),
                                Text('Jawabanmu: ${answer == null ? "Tidak dijawab" : question.options[answer]}',
                                  style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                                Text('Jawaban benar: ${question.options[question.correctIndex]}',
                                  style: const TextStyle(color: AppTheme.teal, fontWeight: FontWeight.w800)),
                                const SizedBox(height: 6),
                                Text(question.explanation, style: const TextStyle(fontSize: 12)),
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  PrimaryButton(label: 'Coba lagi', icon: Icons.refresh_rounded, onPressed: () {
                    context.read<QuizProvider>().restartQuiz();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const QuizScreen()));
                  }),
                  const SizedBox(height: 10),
                  SizedBox(width: double.infinity, child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<QuizProvider>().restartQuiz();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);
                    },
                    icon: const Icon(Icons.home_rounded),
                    label: const Text('Kembali ke beranda'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _greeting(int score) {
    if (score >= 90) return 'Luar biasa!';
    if (score >= 70) return 'Kerja hebat!';
    if (score >= 50) return 'Terus berkembang!';
    return 'Tetap semangat!';
  }

  Widget _stat(BuildContext context, IconData icon, String value, String label, Color color) => Column(
    children: [
      Icon(icon, color: color, size: 21),
      const SizedBox(height: 5),
      Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
      Text(label, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
    ],
  );
}
