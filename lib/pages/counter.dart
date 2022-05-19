import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String dropdownValue = "Pipe Counter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pipe Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: NetworkImage("https://www.fenwickhomeservices.com/wp-content/uploads/2021/01/Types-of-PVC-Pipes-Fenwick-Website-Photo.jpg"),
              ),
              DropdownButton(
                isExpanded: true,
                value: dropdownValue,
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
              Text("Select an image to Count", style: TextStyle(fontSize: 10.sp),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.image, size: 40.sp,),
                      ),
                      Text("Use Existing Image", style: TextStyle(fontSize: 10.sp), maxLines: 2,),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.camera_alt_outlined, size: 40.sp,),
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
    );
  }
}
