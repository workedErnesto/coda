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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.onPrimary,
        border: Border.all(color: theme.hintColor.withOpacity(0.3)),
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
    );
  }
}
