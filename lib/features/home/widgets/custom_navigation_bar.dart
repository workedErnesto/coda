import 'dart:ui';

import 'package:coda/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onPressed,
    required this.activeIndex,
  });

  final Function onPressed;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = [
      {'icon': Icons.search_rounded, 'label': 'Search'},
      {'icon': Icons.favorite_border_rounded, 'label': 'Favorite'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
    ];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.scaffoldBackgroundColor.withOpacity(0.8),
            border: Border.all(color: theme.hintColor.withOpacity(0.2)),
          ),
          padding: EdgeInsets.all(16),
          height: 98,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.asMap().entries.map((entry) {
                return NavigationBarItem(
                  onPressed: onPressed,
                  isActive: activeIndex == entry.key,
                  icon: entry.value['icon'] as IconData,
                  label: entry.value['label'] as String,
                  index: entry.key,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
