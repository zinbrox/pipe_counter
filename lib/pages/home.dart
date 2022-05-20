import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/counter.dart';
import 'package:pipe_counter/pages/history.dart';
import 'package:pipe_counter/pages/profile.dart';
import 'package:sizer/sizer.dart';

final pageController = PageController();

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

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 12.h,
        child: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.red,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
            backgroundColor: Colors.red,
            //selectedItemColor: Colors.orange,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 15.sp,), label: "Profile",),
              BottomNavigationBarItem(icon: Icon(Icons.add, size: 15.sp,), label: "Count",),
              BottomNavigationBarItem(icon: Icon(Icons.history, size: 15.sp,), label: "History",),
            ],
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
              pageController.jumpToPage(index);
            },
          ),
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
