import 'package:coda/core/data/datasources/i_theme_local_data_source.dart';
import 'package:coda/core/domain/repository/i_theme_repository.dart';

class ThemeRepository implements IThemeRepository {
  const ThemeRepository({required this.themeLocalDataSource});

  final IThemeLocalDataSource themeLocalDataSource;
  @override
  Future<bool> fetchCurrentTheme() async => await themeLocalDataSource.fetchTheme();

  @override
  Future<void> saveTheme(bool value) async => await themeLocalDataSource.saveTheme(value);
}
