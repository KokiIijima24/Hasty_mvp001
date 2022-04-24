import 'package:fliutter_hello_world/view-ctrl-bloc.dart';
import 'package:fliutter_hello_world/view.dart';
import 'package:flutter/material.dart';

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


