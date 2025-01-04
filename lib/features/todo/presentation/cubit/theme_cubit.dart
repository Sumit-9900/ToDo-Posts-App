import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/usecases/get_theme.dart';
import 'package:todo_post_app/features/todo/domain/usecases/save_theme.dart';

class ThemeCubit extends Cubit<bool> {
  final SaveTheme _saveTheme;
  final GetTheme _getTheme;
  ThemeCubit({required SaveTheme saveTheme, required GetTheme getTheme})
      : _saveTheme = saveTheme,
        _getTheme = getTheme,
        super(false);

  void toggleTheme() async {
    final isDarkMode = !state;
    await _saveTheme(isDarkMode);
    emit(isDarkMode);
  }

  void loadTheme() {
    final isDarkMode = _getTheme(NoParams());
    emit(isDarkMode);
  }
}
