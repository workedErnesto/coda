import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.onPressed,
    required this.isActive,
    required this.icon,
    required this.label,
    required this.index,
  });

  final Function onPressed;
  final bool isActive;
  final IconData icon;
  final String label;
  final int index;
  @override
  Widget build(BuildContext context) {
    final double size = 28;
    final theme = Theme.of(context);
    final activeColor = theme.colorScheme.primary;
    final hintColor = theme.hintColor;
    
    return Expanded(
      child: InkWell(
        onTap: () => onPressed(index),
        child: Container(
          decoration: BoxDecoration(
            color: activeColor.withOpacity(isActive ? 0.20 : 0),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Icon(icon, size: size, color: isActive ? activeColor : hintColor),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? activeColor : hintColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
