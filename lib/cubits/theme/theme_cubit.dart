import 'package:bloc/bloc.dart';
import 'package:cubit_bloc/blocs/theme/theme_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());


  void changeTheme(int randInt) {
      if (randInt % 2 == 0) {
        emit(state.copyWith(appTheme: AppTheme.light, randomNum: randInt));
        
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark, randomNum: randInt));
      }
  }
}

