import 'package:coda/core/domain/repository/i_theme_repository.dart';

class FetchCurrentThemeUseCase {
  FetchCurrentThemeUseCase({required IThemeRepository repository}) : _repository = repository;
  final IThemeRepository _repository;
  
  Future<bool> call() async =>
    await _repository.fetchCurrentTheme();
}
