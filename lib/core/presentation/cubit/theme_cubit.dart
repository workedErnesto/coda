import 'package:coda/core/domain/usecase/fetch_current_theme_use_case.dart';
import 'package:coda/core/domain/usecase/save_theme_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required FetchCurrentThemeUseCase fetchCurrentThemeUseCase, required SaveThemeUseCase saveThemeUseCase}) : _fetchCurrentThemeUseCase = fetchCurrentThemeUseCase, _saveThemeUseCase = saveThemeUseCase,
      super(ThemeInitial());

  Future<void> toogleTheme(bool value) async {
    await _saveThemeUseCase(value);
    value ? emit(ThemeDark()) : emit(ThemeLight());
  }

  Future<void> loadInitialTheme() async {
    final bool isDark = await _fetchCurrentThemeUseCase();
    isDark ? emit(ThemeDark()) : emit(ThemeLight());
  }

  final FetchCurrentThemeUseCase _fetchCurrentThemeUseCase;
  final SaveThemeUseCase _saveThemeUseCase;
}
