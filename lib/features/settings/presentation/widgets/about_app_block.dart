import 'package:coda/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutAppBlock extends StatelessWidget {
  const AboutAppBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: BaseContainer(
          padding: EdgeInsets.symmetric(vertical: 16),
          borderColor: theme.hintColor.withOpacity(0.1),
          child: Column(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: theme.hintColor,
                size: 50,
              ),
              Text(
                'coda',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'version: 1.0.0',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'made with love.\nfor true music lovers',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: theme.hintColor.withOpacity(0.95),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
