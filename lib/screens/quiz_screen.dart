import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/answer_option.dart';
import '../widgets/primary_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width > 600 ? width * .18 : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sesi kuis', style: TextStyle(fontWeight: FontWeight.w900)),
        leading: IconButton(
          tooltip: 'Kembali ke beranda',
          icon: const Icon(Icons.close_rounded),
          onPressed: () => _confirmExit(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(child: Text('${quiz.currentIndex + 1}/${quiz.totalQuestions}',
              style: const TextStyle(fontWeight: FontWeight.w900))),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Padding(
              padding: EdgeInsets.fromLTRB(horizontal, 10, horizontal, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(value: quiz.progress, minHeight: 8,
                      backgroundColor: AppTheme.violet.withValues(alpha: .13),
                      color: AppTheme.violet),
                  ),
                  const SizedBox(height: 24),
                  Text(question.category.toUpperCase(), style: const TextStyle(
                    color: AppTheme.violet, fontWeight: FontWeight.w900, letterSpacing: 1.5, fontSize: 12)),
                  const SizedBox(height: 10),
                  Text(question.prompt, style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900, height: 1.2)),
                  const SizedBox(height: 8),
                  Text('Pilih satu jawaban yang paling tepat.',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      itemCount: question.options.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => AnswerOption(
                        label: question.options[index],
                        index: index,
                        selected: quiz.answers[quiz.currentIndex] == index,
                        onTap: () => context.read<QuizProvider>().selectAnswer(index),
                      ),
                    ),
                  ),
                  if (quiz.answers[quiz.currentIndex] != null) ...[
                    const SizedBox(height: 8),
                    Text('Jawaban dipilih. Kamu masih bisa mengubahnya sebelum lanjut.',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12)),
                  ],
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      if (quiz.currentIndex > 0) ...[
                        Expanded(child: OutlinedButton.icon(
                          onPressed: () => context.read<QuizProvider>().previousQuestion(),
                          icon: const Icon(Icons.arrow_back_rounded),
                          label: const Text('Kembali'),
                          style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 17)),
                        )),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        flex: 2,
                        child: PrimaryButton(
                          label: quiz.currentIndex == quiz.totalQuestions - 1 ? 'Lihat hasil' : 'Soal berikutnya',
                          icon: quiz.currentIndex == quiz.totalQuestions - 1 ? Icons.emoji_events_rounded : Icons.arrow_forward_rounded,
                          onPressed: quiz.answers[quiz.currentIndex] == null ? null : () {
                            if (quiz.currentIndex < quiz.totalQuestions - 1) {
                              context.read<QuizProvider>().nextQuestion();
                            } else {
                              context.read<QuizProvider>().finishQuiz();
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const ResultScreen()));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmExit(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Akhiri sesi?'),
        content: const Text('Jika kembali ke beranda, sesi kuis saat ini akan diakhiri.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Lanjut kuis')),
          FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Ke beranda')),
        ],
      ),
    );
    if (shouldExit == true && context.mounted) Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
