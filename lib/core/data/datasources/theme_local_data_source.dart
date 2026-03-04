import 'package:coda/core/constants/shared_prefs_key.dart';
import 'package:coda/core/data/datasources/i_theme_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDataSource implements IThemeLocalDataSource {
  final SharedPreferences _prefs;

  const ThemeLocalDataSource({required SharedPreferences prefs})
    : _prefs = prefs;
  @override
  Future<bool> fetchTheme() async => _prefs.getBool(currentTheme) ?? false;

  @override
  Future<void> saveTheme(bool value) async =>
      await _prefs.setBool(currentTheme, value);
}
