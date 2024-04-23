import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/util.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? xf;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF5252),
        title: Text("Home page",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              setState(() {

              });
            },
              child: Icon(Icons.restart_alt,color: Colors.white,))
        ],
      ),
    backgroundColor: Color(0xffF5F5F5),
      body:ListView.builder(

        itemCount: student.Studentdetail.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Detail_page" ,arguments: index);
              },
              child: Container(
                  height:85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: Offset(0, 3), // Offset
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 15),
                        child: InkWell(
                          onTap: () async{
                            XFile? Simg =
                            await ImagePicker().pickImage(source: ImageSource.camera);
                            xf = Simg?.path ?? "";
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundImage: FileImage(File(xf??student.Studentdetail[index]["Img"])),
                            radius: 35,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15),
                            child: Text(
                              "Name :${student.Studentdetail[index]["Name"]}",style: TextStyle(color: Colors.black,fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15),
                            child: Text(
                              "Grid :${student.Studentdetail[index]["Grid"]}",style: TextStyle(color: Colors.black,fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15),
                            child: Text(
                              "Standard :${student.Studentdetail[index]["Std"]}",style: TextStyle(color: Colors.black,fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                        Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: IconButton(onPressed: () {
                         showDialog(context: context, builder: (context) {
                           return AlertDialog(backgroundColor: Colors.white,
                           title: Text("Edit Detail"),
                           content: SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             child: Column(
                               // crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 InkWell(
                                   onTap: () async{
                                     XFile? Simg =
                                     await ImagePicker().pickImage(source: ImageSource.camera);
                                     xf = Simg?.path ?? "";
                                     setState(() {});
                                   },
                                   child: CircleAvatar(

                                     radius: 80,
                                     backgroundImage: FileImage(File(xf??student.Studentdetail[index]["Img"])),

                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 TextFormField(

                                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Name"),
                                   initialValue: "${student.Studentdetail[index]["Name"]}",
                                   onChanged: (value) {
                                     student.Studentdetail[index]["Name"]=value;
                                   },
                                   textInputAction: TextInputAction.next,
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Grid"),
                                   initialValue: "${student.Studentdetail[index]["Grid"]}",
                                   onChanged: (value) {
                                     student.Studentdetail[index]["Grid"]=value;
                                   },
                                   textInputAction: TextInputAction.next,
                                 ),SizedBox(height: 10,),
                                 TextFormField(
                                   decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Std"),
                                   initialValue: "${student.Studentdetail[index]["Std"]}",
                                   onChanged: (value) {
                                     student.Studentdetail[index]["Std"]=value;
                                   },
                                   textInputAction: TextInputAction.done,
                                 ),
                               ],
                             ),
                           ),

                           actions: [
                             ElevatedButton(onPressed: () {
                               Navigator.pop(context);
                               setState(() {

                               });


                           }, child: Text("Save")),
                             ElevatedButton(onPressed: () {
                               Navigator.pop(context);

                             }, child: Text("Cancle")),
                           ],);

                         },);
                          setState(() {

                          });

                        }, icon: Icon(Icons.edit,size: 30,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: IconButton(onPressed: () {
                          student.Studentdetail.removeAt(index);
                          setState(() {

                          });
                        }, icon: Icon(Icons.delete,size: 30,)),
                      )



                    ],
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.pushNamed(context, "Add_detail");
        setState(() {
        });

      },child: Icon(Icons.add,color: Colors.white,size: 35,),backgroundColor: Color(0xffFF5252)),
    );
  }
  void set(){
    setState(() {

    });
  }
}
