import 'package:flutter/material.dart';
import 'main.dart';
import 'match_list.dart';

class View extends StatefulWidget {
  final Stream<int> viewCtrl;

  View({Key? key,required this.viewCtrl}) : super(key: key);
  _View createState() => _View();
}

class _View extends State<View> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0); // 最初に表示するインデックス
    listenPage();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        children: [MyHomePage(title: 'Flutter Demo Home Page2',), MatchList()],
    );
  }

  listenPage() {
    widget.viewCtrl.listen((event) {
      _pageController.animateToPage(event,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}