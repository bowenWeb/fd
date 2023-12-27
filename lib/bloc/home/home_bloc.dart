import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/api_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.idle()){
    on<SetEvent>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<GetClusterListEvent>((event, emit) async {
      try{
        final http = HttpService();
        var res = await http.get('http://192.168.1.62:9001/cluster/infos');
        Map result = res.data;
        List<dynamic> data = result['data'];
        emit(state.copyWith(title:'home666',clusters: data));
      }catch(error){
        emit(state.copyWith(title: "error"));
      }

    });
  }


}