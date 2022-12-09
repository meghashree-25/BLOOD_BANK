import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class donorlistScreen extends StatelessWidget {
  

  List camps = [];

  Future<void> getDonors() async {
    final result =
        await FirebaseFirestore.instance.collection("users").get();
    camps = result.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Available Donors",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w300,color: Colors.black),),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: FutureBuilder(
                  future: getDonors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: camps.length,
                      itemBuilder : (context,index) =>
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black,width: 1.0)
                          ),
                          child: ExpansionTile(
                            childrenPadding:  const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 2.0),
                            leading: const CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.deepOrangeAccent,
                              child: Icon(
                                Icons.campaign_outlined,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              "${camps[index]["name"]}",
                            ),
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            children: [
                              ListTile(
                                title: Text(
                                  "Age",
                                  style: TextStyle(
                                      fontSize: 3.w,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  "${camps[index]["age"]}",
                                  style: TextStyle(fontSize: 4.w),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Blood Group",
                                  style: TextStyle(
                                      fontSize: 3.w,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  "${camps[index]["bloodGroup"]}",
                                  style: TextStyle(fontSize: 4.w),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "phone",
                                  style: TextStyle(
                                      fontSize: 3.w,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  "${camps[index]["phone"]}",
                                  style: TextStyle(fontSize: 4.w),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Address :",
                                  style: TextStyle(
                                      fontSize: 3.w,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  "${camps[index]["address"]}",
                                  style: TextStyle(fontSize: 4.w),
                                ),
                              ),
                            ],
                          ),
                        ),
                    );
                  })),
        ));
  }
}
