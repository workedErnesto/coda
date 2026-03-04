import 'package:coda/core/presentation/cubit/theme_cubit.dart';
import 'package:coda/core/router/router.dart';
import 'package:coda/core/themes/dark_theme.dart';
import 'package:coda/core/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodaApp extends StatefulWidget {
  const CodaApp({super.key});

  @override
  State<CodaApp> createState() => _CodaAppState();
}

class _CodaAppState extends State<CodaApp> {
  final _config = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDark = state is ThemeDark;
        final mode = isDark ? ThemeMode.dark : ThemeMode.light;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          routerConfig: _config,
        );
      },
    );
  }
}
