import 'package:coda/features/settings/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeBlock extends StatelessWidget {
  const ThemeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlockTemplate(
      title: 'Внешний вид',
      label: "Темная тема",
      icon: Icons.wb_sunny_outlined,
      action: CupertinoSwitch(
        value: false,
        onChanged: (_) {},
        trackOutlineWidth: WidgetStatePropertyAll(0),
        trackOutlineColor: WidgetStatePropertyAll(
          theme.disabledColor.withOpacity(0.2),
        ),
        inactiveTrackColor: theme.disabledColor.withOpacity(0.2),
      ),
    );
  }
}
