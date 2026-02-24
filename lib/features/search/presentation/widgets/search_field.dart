import 'package:coda/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: BaseContainer(
        child: TextField(
          autocorrect: false,
          maxLength: 30,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: theme.hintColor,
              size: 28,
            ),
            contentPadding: EdgeInsets.zero,
            counterText: '',
            fillColor: theme.colorScheme.onPrimary,
            filled: true,
            hintText: 'Треки, тексты, артисты...',
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: theme.hintColor,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
