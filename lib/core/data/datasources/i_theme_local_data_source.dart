abstract interface class IThemeLocalDataSource {
  Future<bool> fetchTheme();
  Future<void> saveTheme(bool value);
}
