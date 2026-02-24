import 'package:auto_route/auto_route.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:coda/features/settings/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(bottom: 16),
        child: CustomScrollView(
          slivers: [
            BaseAppBar(title: 'Настройки', height: 30),
            ThemeBlock(),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            StorageBlock(),
            AboutAppBlock(),
          ],
        ),
      ),
    );
  }
}
