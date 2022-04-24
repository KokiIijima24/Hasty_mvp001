import 'package:fliutter_hello_world/view-ctrl-bloc.dart';
import 'package:fliutter_hello_world/view.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';

import 'UserModel.dart';
import 'footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  String title = "Hasty";

   MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  late ViewCtrlBloc viewCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: View(viewCtrl: viewCtrl.viewStream),
        bottomNavigationBar: Footer(viewCtrl: viewCtrl.viewSink),
    ));
  }

  @override
  void initState() {
    super.initState();
    viewCtrl = ViewCtrlBloc();
  }

  @override
  void dispose() {
    viewCtrl.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final identifiableUsers = <IdentifiableUser>[
      IdentifiableUser(
        user: User(),
      ),
      // 必要に応じてデータを追加する
    ];
    return Scaffold(
      body: SwipeableStack<IdentifiableUser>(
        dataSet: identifiableUsers,
        builder: (context, IdentifiableUser data, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.9,
              height: constraints.maxHeight * 0.8,
              color: Colors.blue,
              alignment: Alignment.center
            ),
          );
        },
      ),
    );
  }
}
