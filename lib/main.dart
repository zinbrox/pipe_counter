import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/home.dart';
import 'package:pipe_counter/pages/log_in.dart';
import 'package:pipe_counter/pages/profile.dart';
import 'package:sizer/sizer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            '/loginPage':(context) => LoginPage(),
            '/homePage':(context) => HomePage(),
            '/profilePage':(context) => ProfilePage(),
          },
        );
      }
    );
  }
}

