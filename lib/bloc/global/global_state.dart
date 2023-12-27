part of 'global_bloc.dart';

class GlobalState extends Equatable {
  final int navigationBarIndex;
  final String language;
  final GlobalKey context;
  const GlobalState({required this.navigationBarIndex,required this.language,required this.context});

  @override
  List<Object> get props => [navigationBarIndex,language,context];

  factory GlobalState.idle() {
    return GlobalState(
        navigationBarIndex:0,
        language:LanguageType.zh,
        context:GlobalKey()
    );
  }

  GlobalState copyWith({int? navigationBarIndex,String? language,GlobalKey?context}) {
    return GlobalState(
        navigationBarIndex: navigationBarIndex ?? this.navigationBarIndex,
        language:language ?? this.language,
        context:context ?? this.context
    );
  }
}