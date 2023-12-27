import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/bloc/global/global_bloc.dart';
import 'package:untitled/pages/detail/index.dart';
import 'package:untitled/pages/home/index.dart';
import 'package:untitled/pages/my/index.dart';
import 'package:untitled/pages/user/index.dart';

import 'generated/l10n.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalBloc(),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (ctx,state){
          final List<Widget> renderPageList = [
            const HomePage(),
            const UserPage(),
            const MyPage(),
          ];
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
             colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
             useMaterial3: true,
            ),
            home: Scaffold(
              body: renderPageList[state.navigationBarIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.navigationBarIndex,
                onTap: (int index){
                  BlocProvider.of<GlobalBloc>(ctx).add(SetNavigationBarIndexEvent(index:index));
                },
                items:  [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_rounded),
                    label: state.language
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: "User"
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "My"
                  )
                ],
              ),
            ),
            localizationsDelegates: const [
             GlobalMaterialLocalizations.delegate,
             GlobalWidgetsLocalizations.delegate,
             GlobalCupertinoLocalizations.delegate,
             S.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(state.language),
            routes: <String,WidgetBuilder>{
             '/home':(BuildContext context)=> const HomePage(),
             '/my':(BuildContext context)=> const MyPage(),
             '/user':(BuildContext context)=> const UserPage(),
             '/detail':(BuildContext context) => const DetailPage(),
            },
           );
        }
      ),
    );
  }
}
