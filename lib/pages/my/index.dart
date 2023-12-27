import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/global/global_bloc.dart';
import '../../generated/l10n.dart';
import '../../models/language.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key,BuildContext ? ctx}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
        title: Text(S.of(context).my),
      ),
      body: BlocProvider(
          create: (context) => GlobalBloc(),
          child: BlocBuilder<GlobalBloc, GlobalState>(
              builder: (context,state){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(state.language),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (ctx) {
                                return SimpleDialog(
                                  title: const Text("请选择语言"),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        BlocProvider.of<GlobalBloc>(context).add(SetLanguageEvent(language: LanguageType.zh));
                                        Navigator.pop(context, 1);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 6),
                                        child: Text('中文'),
                                      ),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        BlocProvider.of<GlobalBloc>(context).add(SetLanguageEvent(language: LanguageType.en));
                                        Navigator.pop(context, 2);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 6),
                                        child: Text('English'),
                                      ),
                                    ),
                                  ],
                                );
                              }
                          );
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).languageSetting),
                            const Icon(Icons.chevron_right)
                          ],
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).themeSetting),
                            const Icon(Icons.chevron_right)
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              }
          )
      ),

    );
  }
}
