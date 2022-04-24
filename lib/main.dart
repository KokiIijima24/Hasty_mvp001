import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';

import 'UserModel.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
