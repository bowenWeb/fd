import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/global/global_bloc.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My"),
      ),
      // GlobalBloc 实例已经 在最上层 main.dart 创建了子页面就不能创建了，不然不是一个实例了，直接用 BlocBuilder就好了
      body: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (ctx) {
                          return SimpleDialog(
                            title: const Text("请选择主题"),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {
                                  ThemeData data = ThemeData(
                                    colorScheme: ColorScheme.fromSeed(
                                        seedColor: Colors.blue),
                                    useMaterial3: true,
                                  );
                                  context
                                      .read<GlobalBloc>()
                                      .add(SetThemeEvent(theme: data));
                                  Navigator.of(context).pop();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Text('蓝色'),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  ThemeData data = ThemeData(
                                    colorScheme: ColorScheme.fromSeed(
                                        seedColor: Colors.purple),
                                    useMaterial3: true,
                                  );
                                  context
                                      .read<GlobalBloc>()
                                      .add(SetThemeEvent(theme: data));
                                  Navigator.of(context).pop();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Text('紫色'),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("主题设置"), Icon(Icons.chevron_right)],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
