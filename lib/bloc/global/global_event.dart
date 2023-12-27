part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
  @override
  List<Object?> get props => [];
}

class SetNavigationBarIndexEvent extends GlobalEvent{
  final int index;
  const SetNavigationBarIndexEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class SetLanguageEvent extends GlobalEvent{
  final String language;
  const SetLanguageEvent({required this.language});

  @override
  List<Object?> get props => [language];
}

class SetContextEvent extends GlobalEvent{
  final GlobalKey context;
  const SetContextEvent({required this.context});

  @override
  List<Object?> get props => [context];
}

