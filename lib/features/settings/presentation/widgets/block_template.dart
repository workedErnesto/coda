import 'package:coda/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BlockTemplate extends StatelessWidget {
  const BlockTemplate({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
    required this.action,
  });

  final String title;
  final String label;
  final IconData icon;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.hintColor,
              ),
            ),
          ),
          SizedBox(height: 4),
          BaseContainer(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                elevation: 0,
                side: isDark
                    ? BorderSide.none
                    : BorderSide(color: theme.hintColor.withOpacity(0.15)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                backgroundColor: theme.colorScheme.onPrimary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          icon,
                          size: 24,
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        label,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  action,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
