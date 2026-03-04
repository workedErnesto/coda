import 'package:coda/core/domain/repository/i_theme_repository.dart';

class SaveThemeUseCase {
  SaveThemeUseCase({required IThemeRepository repository})
    : _repository = repository;
  final IThemeRepository _repository;
  Future<void> call(bool value) async => await _repository.saveTheme(value);
}
