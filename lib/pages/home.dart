import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/counter.dart';
import 'package:pipe_counter/pages/history.dart';
import 'package:pipe_counter/pages/profile.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final tabs=[
    ProfilePage(),
    Counter(),
    HistoryPage(),
  ];

  final pageController = PageController();
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 15.h,
        child: BottomNavyBar(
//        showSelectedLabels: true,
//        showUnselectedLabels: false,
//        type: BottomNavigationBarType.fixed,
          selectedIndex: _currentIndex,
          //selectedItemColor: Colors.orange,
          items: [
            BottomNavyBarItem(icon: Icon(Icons.account_circle), title: Text("Profile"), activeColor: Colors.redAccent),
            BottomNavyBarItem(icon: Icon(Icons.add), title: Text("Count"), activeColor: Colors.redAccent),
            BottomNavyBarItem(icon: Icon(Icons.history), title: Text("History"), activeColor: Colors.redAccent),
          ],
          onItemSelected: (index){
            setState(() {
              _currentIndex = index;
            });
            pageController.jumpToPage(index);
          },
        ),
      ),
      body: PageView(
        children: tabs,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
