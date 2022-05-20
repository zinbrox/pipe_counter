import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pipe_counter/pages/home.dart';
import 'package:sizer/sizer.dart';

import '../helpers/sign_in.dart';

class LoginPage extends StatelessWidget {
  String email = "", password = "";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: NetworkImage("https://resoluteai.in/static/media/logo.9bb1eca6.png"),
                height: 20.h,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Username/ E-mail",
                  hintStyle: TextStyle(fontSize: 10.sp),
                  contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                ),
                style: TextStyle(fontSize: 10.sp),
                onChanged: (String value) {
                  email = value;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 10.sp),
                  contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                ),
                style: TextStyle(fontSize: 10.sp),
                onChanged: (String value) {
                  password = value;
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 8.h,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint("Login Pressed");
                      AuthenticationHelper()
                          .signIn(email: email, password: password)
                          .then((result) {
                        if (result == null) {
                          debugPrint("Sign In Successful");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        } else {
                          debugPrint("Sign In Failed");
                          Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
//                              textColor: Colors.white,
//                              fontSize: 16.0
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Submit", style: TextStyle(fontSize: 15.sp),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
