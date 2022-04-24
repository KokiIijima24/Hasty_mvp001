import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';

import '../UserModel.dart';

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