part of 'global_bloc.dart';

class GlobalState extends Equatable {
  final int navigationBarIndex;
  final String language;
  final ThemeData theme;
  const GlobalState(
      {required this.navigationBarIndex,
      required this.language,
      required this.theme});

  @override
  List<Object> get props => [navigationBarIndex, language, theme];

  factory GlobalState.idle() {
    return GlobalState(
        navigationBarIndex: 0,
        language: LanguageType.zh,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ));
  }

  GlobalState copyWith(
      {int? navigationBarIndex, String? language, ThemeData? theme}) {
    return GlobalState(
        navigationBarIndex: navigationBarIndex ?? this.navigationBarIndex,
        language: language ?? this.language,
        theme: theme ?? this.theme);
  }
}
