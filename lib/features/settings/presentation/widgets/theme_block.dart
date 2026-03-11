import 'package:coda/core/presentation/cubit/theme_cubit.dart';
import 'package:coda/features/settings/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBlock extends StatelessWidget {
  const ThemeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void onTap(bool value) => context.read<ThemeCubit>().toogleTheme(value);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDark = state is ThemeDark;
        return BlockTemplate(
          onTap: () => onTap,
          title: 'Внешний вид',
          label: "Темная тема",
          icon: Icons.wb_sunny_outlined,
          action: CupertinoSwitch(
            value: isDark,
            onChanged: (value) => onTap(value),
            trackOutlineWidth: WidgetStatePropertyAll(0),
            trackOutlineColor: WidgetStatePropertyAll(
              theme.disabledColor.withOpacity(0.2),
            ),
            inactiveTrackColor: theme.disabledColor.withOpacity(0.2),
          ),
        );
      },
    );
  }
}
