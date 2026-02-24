import 'package:coda/core/router/router.dart';
import 'package:coda/core/themes/light_theme.dart';
import 'package:flutter/material.dart';

class CodaApp extends StatefulWidget {
  const CodaApp({super.key});

  @override
  State<CodaApp> createState() => _CodaAppState();
}

class _CodaAppState extends State<CodaApp> {
  final _config = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: _config,
    );
  }
}
