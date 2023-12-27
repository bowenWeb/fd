part of 'user_bloc.dart';

class UserState extends Equatable{
  final User user;

  const UserState({required this.user});

  factory UserState.initial() {
    return const UserState(user: User(username: '', age: ''),);
  }

  UserState copyWith({
    User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}