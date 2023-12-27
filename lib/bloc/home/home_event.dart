part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class SetEvent extends HomeEvent {
  final String title;
  const SetEvent({required this.title});

  @override
  List<Object?> get props => [title];
}


class GetClusterListEvent extends HomeEvent{
  const GetClusterListEvent();

  @override
  List<Object?> get props => [];
}