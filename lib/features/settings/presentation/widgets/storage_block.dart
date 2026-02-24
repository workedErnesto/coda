
import 'package:coda/features/settings/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StorageBlock extends StatelessWidget {
  const StorageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlockTemplate(
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
