import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()){
    on<UpdateUserEvent>((event, emit) {
      emit(state.copyWith(user: User(username: event.user.username, age: event.user.age)));
    });
  }
}