import 'package:coda/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: BaseContainer(
        borderRadius: BorderRadius.circular(50),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        child: TextButton.icon(
          onPressed: () {},
          label: Text(
            "В избранное",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: Icon(
            Icons.favorite_outline_outlined,
            color: theme.colorScheme.onSurface,
            size: 28,
          ),
        ),
      ),
    );
  }
}
