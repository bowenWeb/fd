import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/home/home_bloc.dart';
import 'package:untitled/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCluster() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).home),
      ),

      body: Center(
        child: BlocProvider(
          create: (context) => HomeBloc()..add(const GetClusterListEvent()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.clusters.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map item = state.clusters[index];
                        return GestureDetector(
                          child: ListTile(title: Text("${item['clusterName']}")),
                          onTap: (){
                            Navigator.of(context).pushNamed('/detail',arguments: {"clusterName":item['clusterName']});
                          },
                        );
                      }
                    ),
                  ),
                ],
              );
            },
          )
        ),
      ),
    );
  }
}
