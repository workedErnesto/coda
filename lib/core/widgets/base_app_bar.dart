import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.action,
    this.height,
  });

  final String title;
  final Widget? bottom;
  final Widget? action;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      floating: true,
      centerTitle: false,
      snap: true,
      pinned: true,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0,
      title: Text(
        title,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [action ?? SizedBox()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height ?? 60),
        child: bottom ?? SizedBox(),
      ),
    );
  }
}
