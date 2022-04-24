import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Sink<int> viewCtrl;

  Footer({Key? key, required this.viewCtrl}) : super(key: key);

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  // ページのインデックス
  int pageIndex = 0;

  navigationItem() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.format_list_bulleted_outlined),
        label: 'Matched',
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (_pageIndex) {
          pageIndex = _pageIndex;
          print("page index");
          print(_pageIndex);
          widget.viewCtrl.add(_pageIndex);
        },
        items: navigationItem(),
    );
  }
}