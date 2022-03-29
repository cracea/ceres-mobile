import 'dart:ffi';

import 'package:ceres/api/dtos/menu_dto.dart';
import 'package:flutter/material.dart';

import 'api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ceres'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late Future<List<MenuDto>> futureMenuesDto = getProjectDetails();

  Future<List<MenuDto>> getProjectDetails() async {
    var result = await fetchMenues();
    return result;
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<MenuDto>> projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data?.length,
          itemBuilder: (context, index) {
            MenuDto project = projectSnap.data![index];

            if (project.items != null && project.items!.isNotEmpty) {
              return Column(children: <Widget>[
                Text("${project.name} HAS ${project.items!.length} ITEMS"),
                ListView.builder(
                  shrinkWrap:
                      true, //Found that I have to use this paramater for nested ListView
                  physics:
                      ClampingScrollPhysics(), //Found that I have to use this paramater for nested ListView
                  itemCount: project.items!.length,
                  itemBuilder: (context, index) {
                    MenuItemDto menuItem = project.items![index];
                    return Column(
                      children: <Widget>[Text(menuItem.name)],
                    );
                  },
                )
              ]);
            } else {
              return Column(
                children: <Widget>[Text("${project.name} HAS NO ITEMS")],
              );
            }
          },
        );
      },
      future: getProjectDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu list'),
      ),
      body: projectWidget(),
    );
  }
}
