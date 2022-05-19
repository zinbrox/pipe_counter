import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/home.dart';
import 'package:pipe_counter/pages/profile.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Pipe Counter',
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.red,
              accentColor: Colors.redAccent,
            ),
            primaryColor: Colors.redAccent,
          ),
          initialRoute: '/homePage',
          routes: {
            '/homePage':(context) => HomePage(),
            '/profilePage':(context) => ProfilePage(),
          },
        );
      }
    );
  }
}

