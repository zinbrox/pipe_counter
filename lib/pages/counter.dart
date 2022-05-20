import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String dropdownValue = "Pipe Counter";

  File file = File("");

  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  bool _loadingProcessing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("Pipe Counter"),
        centerTitle: true,
      ),
       */
      body: file.path=="" ? SafeArea(
        child: Center(
          child: Container(
            //height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: file.path==""? Image(
                  image: NetworkImage("https://www.fenwickhomeservices.com/wp-content/uploads/2021/01/Types-of-PVC-Pipes-Fenwick-Website-Photo.jpg"),
                      height: 40.h,
                ) : Image(
                      image: FileImage(file),
                      height: 40.h,
                    )
                ),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: SizedBox(
                    height: 6.h,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownValue,
                          elevation: 5,
                          items: <String>['Pipe Counter']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: 15.sp),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          }),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Text("Select an image to Count", style: TextStyle(fontSize: 10.sp),),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            debugPrint("Clicked open existing");
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'png' 'jpeg'],
                            );
                            if (result != null) {
                              setState(() {
                                file = File(result.files.single.path!);
                              });
                            } else {
                              debugPrint("User cancelled picker");
                            }

                            if(file.path!="") {
                              Fluttertoast.showToast(
                                msg: "Sending image to server",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
//                              textColor: Colors.white,
//                              fontSize: 16.0
                              );

                              //Upload to Firebase
                              var snapshot = await _firebaseStorage.ref()
                                  .child('pipe2.jpg');

                              try {
                                await snapshot.putFile(file);
                                var downloadUrl = await snapshot
                                    .getDownloadURL();
                                debugPrint(downloadUrl);
                              } on Exception catch (e) {
                                debugPrint(e.toString());
                              }

                              Fluttertoast.showToast(
                                msg: "Image sent to server",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
//                              textColor: Colors.white,
//                              fontSize: 16.0
                              );
                              Fluttertoast.showToast(
                                msg: "Image Processing",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
//                              textColor: Colors.white,
//                              fontSize: 16.0
                              );
                              setState(() {
                                _loadingProcessing = false;
                              });
                            }

                          },
                          child: Container(
                            height: 20.h,
                            width: 20.h,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(Icons.image, size: 40.sp, color: Colors.white,),
                          ),
                        ),
                        Text("Use Existing Image", style: TextStyle(fontSize: 10.sp), maxLines: 2,),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Icon(Icons.camera_alt_outlined, size: 40.sp, color: Colors.white,),
                        ),
                        Text("Take a new Image", style: TextStyle(fontSize: 10.sp), maxLines: 2,),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ) : SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
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
                            setState(() {
                              file = File("");
                            });
                          }),
                    ),
                    SizedBox(width: 30,),
                    Text("Pipe Counter", style: TextStyle(fontSize: 10.sp, color: Colors.redAccent),),
                  ],
                ),
                SizedBox(height: 30,),

                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Image(
                        image: FileImage(file),
                        height: 50.h,
                      ),
                    ),
                    _loadingProcessing? const Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(color: Colors.white,))) : SizedBox(),
                  ],
                ),
                const SizedBox(height: 20,),
                !_loadingProcessing? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8.h,
                      width: 20.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.red,
                      ),
                      child: Center(child: Text("32", style: TextStyle(fontSize: 15.sp, color: Colors.white),)),
                    ),
                    SizedBox(width: 30,),
                    Container(
                      height: 8.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.red,
                      ),
                      child: Icon(Icons.share, size: 15.sp, color: Colors.white,),
                    )
                  ],
                ) : SizedBox(),
              ],
            ),
          ),
        ),
      )
    );
  }
}


