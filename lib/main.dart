import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/Detail_page.dart';
import 'package:student_app/home_page.dart';

import 'Add_detail.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) => Homepage(),
        "Add_detail":(context) => Adddetail(),
        "Detail_page":(context) => Detail(),
      },
    );
  }
}
