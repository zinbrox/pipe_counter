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

  int _currentIndex = 1;
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
        height: 12.h,
        width: MediaQuery.of(context).size.width,
        child: BottomNavyBar(
//        showSelectedLabels: true,
//        showUnselectedLabels: false,
//        type: BottomNavigationBarType.fixed,
          selectedIndex: _currentIndex,
          //selectedItemColor: Colors.orange,
          items: [
            BottomNavyBarItem(icon: Expanded(child: Icon(Icons.account_circle, size: 15.sp,)), title: Text("Profile", style: TextStyle(fontSize: 15.sp),), activeColor: Colors.redAccent),
            BottomNavyBarItem(icon: Expanded(child: Icon(Icons.add, size: 15.sp,)), title: Text("Count"), activeColor: Colors.redAccent),
            BottomNavyBarItem(icon: Expanded(child: Icon(Icons.history, size: 15.sp,)), title: Text("History"), activeColor: Colors.redAccent),
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
