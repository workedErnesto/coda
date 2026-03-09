import 'package:coda/core/presentation/widgets/widgets.dart';
import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: BaseContainer(
        child: TextField(
          onChanged: (query) =>
              context.read<SearchBloc>().add(LoadSearchTracks(query: query)),
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
            hintText: 'Треки, артисты...',
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
