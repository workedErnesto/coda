

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class TrackDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrackDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: theme.hintColor.withOpacity(0.3),
                padding: EdgeInsets.all(12),
              ),
              onPressed: () => context.router.maybePop(),
              icon: Icon(
                Icons.arrow_back_outlined,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
