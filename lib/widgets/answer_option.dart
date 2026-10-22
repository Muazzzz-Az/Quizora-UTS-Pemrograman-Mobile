import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnswerOption extends StatelessWidget {
  final String label;
  final int index;
  final bool selected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.label,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final letters = ['A', 'B', 'C', 'D'];
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? AppTheme.violet.withValues(alpha: 0.12) : scheme.surface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? AppTheme.violet : scheme.outlineVariant,
                width: selected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: selected ? AppTheme.violet : scheme.surfaceContainerHighest,
                  foregroundColor: selected ? Colors.white : scheme.onSurface,
                  child: Text(letters[index], style: const TextStyle(fontWeight: FontWeight.w800)),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700))),
                if (selected) const Icon(Icons.check_circle_rounded, color: AppTheme.violet),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
