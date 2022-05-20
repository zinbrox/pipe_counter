
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipe_counter/pages/home.dart';
import 'package:sizer/sizer.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with AutomaticKeepAliveClientMixin{
  List<String> downloadURLs = [], names = [], timeCreated = [];
  bool _loading = true;

  Future<void> getImages() async {
    final storageRef = FirebaseStorage.instance.ref().child("");
    final listResult = await storageRef.listAll();
    for (var item in listResult.items) {
      downloadURLs.add(await item.getDownloadURL());
      var metadata = await item.getMetadata();
      names.add(metadata.name);
      timeCreated.add(metadata.timeCreated.toString());
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("History Page"),
        centerTitle: true,
      ),
       */
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
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
                    Text("History", style: TextStyle(fontSize: 10.sp, color: Colors.redAccent),),
                  ],
                ),
                _loading? Center(child: CircularProgressIndicator(),) :
                    Container(
                      height: MediaQuery.of(context).size.height*0.6,
                      child: ListView.builder(
                        itemCount: names.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 15,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(2.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image(
                                        image: NetworkImage(downloadURLs[index]),
                                        height: 20.h,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(names[index], style: TextStyle(fontSize: 12.sp),),
                                      Text("32", style: TextStyle(fontSize: 12.sp,),),
                                      Text(timeCreated[index], style: TextStyle(fontSize: 12.sp), overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children : [
                                    Icon(Icons.share, color: Colors.red, size: 15.sp),
                                    Icon(Icons.delete, color: Colors.red, size: 15.sp,),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    )
              ],
            ),
          )
        ),
      ),
    );
  }
}
