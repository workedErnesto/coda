import 'package:flutter/material.dart';

class StubFavorite extends StatelessWidget {
  const StubFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverFillRemaining(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.dashboard_customize_outlined,
              size: 44,
              color: theme.hintColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Пока нет избранных\nтреков',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Сохраните любимые треки,\nчтобы быстро получить\nк ним доступ.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
