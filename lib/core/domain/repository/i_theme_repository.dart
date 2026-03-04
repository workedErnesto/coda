abstract interface class IThemeRepository {
  Future<bool> fetchCurrentTheme();
  Future<void> saveTheme(bool value);
}
