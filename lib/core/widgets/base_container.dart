import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.padding,
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),

        border: borderColor == null ? null : Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: theme.hintColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -15,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: theme.hintColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: -10,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: child,
    );
  }
}
