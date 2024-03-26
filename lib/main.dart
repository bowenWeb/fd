import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/global/global_bloc.dart';
import 'package:untitled/pages/detail/index.dart';
import 'package:untitled/pages/home/index.dart';
import 'package:untitled/pages/my/index.dart';
import 'package:untitled/pages/user/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Widget> renderPageList = [
      const HomePage(),
      const UserPage(),
      const MyPage(),
    ];
    return BlocProvider(
      // GlobalBloc 实例 在最上层 main.dart 创建，子页面就不能创建了，不然不是一个实例了，直接用 BlocBuilder就好了，例如 my 页面中
      create: (BuildContext context) => GlobalBloc(),
      child: BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.theme,
          home: Scaffold(
            body: renderPageList[state.navigationBarIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.navigationBarIndex,
              onTap: (int index) {
                BlocProvider.of<GlobalBloc>(context)
                    .add(SetNavigationBarIndexEvent(index: index));
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_rounded), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined), label: "User"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "My")
              ],
            ),
          ),
          locale: Locale(state.language),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => const HomePage(),
            '/my': (BuildContext context) => const MyPage(),
            '/user': (BuildContext context) => const UserPage(),
            '/detail': (BuildContext context) => const DetailPage(),
          },
        );
      }),
    );
  }
}
