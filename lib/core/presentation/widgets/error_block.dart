import 'package:coda/core/presentation/widgets/base_container.dart';
import 'package:flutter/material.dart';

class ErrorBlock extends StatelessWidget {
  const ErrorBlock({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverFillRemaining(
      child: SafeArea(
        top: false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Что-то пошло не так...',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.hintColor,
                ),
              ),
              SizedBox(height: 15),
              BaseContainer(
                borderRadius: BorderRadius.circular(50),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Попробовать еще раз",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
