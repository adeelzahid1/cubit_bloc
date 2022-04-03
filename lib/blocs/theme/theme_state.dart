part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  final int randomNum;
  
  ThemeState({
    this.appTheme = AppTheme.light,
    required this.randomNum,
  });

  factory ThemeState.initial() {
    return ThemeState(randomNum: 0);
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  ThemeState copyWith({
    AppTheme? appTheme,
    int? randomNum,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
       randomNum: randomNum ?? this.randomNum,
    );
  }
}