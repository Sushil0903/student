import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/util.dart';

class Adddetail extends StatefulWidget {
  const Adddetail({super.key});

  @override
  State<Adddetail> createState() => _AdddetailState();
}

class _AdddetailState extends State<Adddetail> {
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  TextEditingController gridcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController stdcontroller = TextEditingController();
  String? xfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF5252),
        foregroundColor: Colors.white,
        title: Text(
          "Add Data",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  XFile? Simg =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  xfile = Simg?.path ?? "";
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundImage: FileImage(File(xfile ?? "")),
                  child: Align(
                      child: Icon(
                    Icons.add,
                    size: 25,
                  )),
                  backgroundColor: Colors.grey,
                  radius: 80,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Enter Grid")),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: gridcontroller,
                  validator: (value)
                  {
                    if (value!.isEmpty) {
                      return "Please enter grid";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Enter Name")),
                  textInputAction: TextInputAction.next,
                  controller: namecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Name";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Enter Std")),
                  controller: stdcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Standerd";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        bool valid = fKey.currentState?.validate() ?? false;
                        if (valid) {
                          fKey.currentState?.save();
                          student.sname = namecontroller.text;
                          student.sgrid = gridcontroller.text;
                          student.sstd = stdcontroller.text;
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Saved")),
                          );
                          print(xfile);
                          Map m={
                            "Name":student.sname,
                            "Grid":student.sgrid,
                            "Std":student.sstd,
                            "Img":xfile
                          };
                          student.Studentdetail.add(m);

                          // student.Studentdetail.add(student.sname);
                          setState(() {

                          });
                          Navigator.pop(context);

                        }



                      },
                      child: Text("Save",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffFF5252)))),
                  Spacer(),

                  ElevatedButton(onPressed: () {
                    stdcontroller.clear();
                    gridcontroller.clear();
                    namecontroller.clear();
                  }, child: Text("Reset",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffFF5252)))),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
