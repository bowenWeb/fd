part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String title;
  final List clusters;
  const HomeState({required this.title,required this.clusters});

  @override
  List<Object> get props => [title];

  factory HomeState.idle() {
    return const HomeState(
      title:'',
      clusters:[]
    );
  }

  HomeState copyWith({String? title,List? clusters}) {
    return HomeState(
      title: title ?? this.title,
      clusters: clusters ?? this.clusters
    );
  }

}
