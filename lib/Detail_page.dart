import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_app/util.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text("Student detail",style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,top: 30),
        child: Container(
          height: 500,
          width: 360,
          decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,spreadRadius: 1)],borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(student.Studentdetail[0]["Img"])),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Name"),
                  initialValue: "${student.Studentdetail[0]["Name"]}",
                  onChanged: (value) {
                    student.Studentdetail[0]["Name"]=value;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Grid"),
                  initialValue: "${student.Studentdetail[0]["Grid"]}",
                  onChanged: (value) {
                    student.Studentdetail[0]["Grid"]=value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Std"),
                  initialValue: "${student.Studentdetail[0]["Std"]}",
                  onChanged: (value) {
                    student.Studentdetail[0]["Std"]=value;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
