

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/home.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("Profile Page"),
        centerTitle: true,
      ),
       */
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            //height: MediaQuery.of(context).size.height*0.8,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      child: FloatingActionButton(
                        child: Icon(Icons.arrow_back, size: 15.sp,),
                          onPressed: () {
                            debugPrint("Back Pressed");
                            pageController.jumpToPage(1);
                          }),
                    ),
                    SizedBox(width: 30,),
                    Text("Profile", style: TextStyle(fontSize: 10.sp, color: Colors.redAccent),),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(2.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: NetworkImage("http://tabib.ae/uploads/articles/free-profile-photo-whatsapp-4_1617693292_1625640491.png"),
                        height: 20.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fname Lname", style: TextStyle(fontSize: 10.sp, color: Colors.white),),
                      Text("admin@gmail.com", style: TextStyle(fontSize: 10.sp, color: Colors.white),),
                      Text("+91 98435 35345", style: TextStyle(fontSize: 10.sp, color: Colors.white),),
                    ],
                  )
                ],
                )
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.contact_mail, size: 10.sp,),
                    title: Text("Change Face", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.delete, size: 10.sp,),
                    title: Text("Clear History", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.key, size: 10.sp,),
                    title: Text("Change Password", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.mail, size: 10.sp,),
                    title: Text("Contact Us", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.public, size: 10.sp,),
                    title: Text("Visit our Website", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                  child: ListTile(
                    leading: Icon(Icons.logout, size: 10.sp,),
                    title: Text("Logout", style: TextStyle(fontSize: 10.sp),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
