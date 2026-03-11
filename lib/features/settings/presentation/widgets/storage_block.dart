import 'package:coda/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:coda/features/settings/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorageBlock extends StatelessWidget {
  const StorageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlockTemplate(
      onTap: () {
        context.read<FavoriteBloc>().add(DeleteAllFavoritesTracks());
      },
      title: 'Память & данные',
      label: 'Очистить кэш',
      icon: Icons.delete_outline_rounded,
      action: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
