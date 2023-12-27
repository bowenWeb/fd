import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/user/user_bloc.dart';
import 'package:untitled/models/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<dynamic> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("User"),
      ),
      body: Center(
          child: BlocProvider(
              create: (context) => UserBloc()..add(
                  const UpdateUserEvent(
                    user: User(
                        username: "wubowen",
                        age: "18"
                    )
                  )
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Text("姓名：${state.user.username},年龄：${state.user.age}");
                },
              )
          ),
      ),
    );
  }
}
