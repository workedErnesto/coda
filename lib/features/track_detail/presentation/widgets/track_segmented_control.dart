import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class TrackSegmentedControl extends StatelessWidget {
  const TrackSegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: CustomSlidingSegmentedControl(
        fixedWidth: 110,
        initialValue: 0,
        innerPadding: EdgeInsets.all(4),
        padding: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.colorScheme.secondary,
        ),
        thumbDecoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        children: {
          0: Text(
            "Оригинал",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          1: Text(
            "Перевод",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          2: Text(
            "Микс",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        },
        onValueChanged: (value) {},
      ),
    );
  }
}
