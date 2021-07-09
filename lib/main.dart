import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mornad/allmenu.dart';
// import 'package:mornad/ko.dart';
import 'package:mornad/main2.dart';
import 'data.dart';

String dataTest = '';

void main() {
  runApp(MeNu());
}

class MeNu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MORNAD',
      home: FirstPage(),
      theme: ThemeData(primaryColor: Colors.teal.shade400),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({
    Key? key,
  }) : super(key: key);
  // final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final txtData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Align(
        child: Container(
          width: 375,
          height: 812,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/MORNAD1.png'), fit: BoxFit.fill)),
        ),
      ),
      Container(
        width: 180,
        margin: EdgeInsets.only(top: 420.0, left: 100),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(29)),
        child: Form(
          key: _formKey,
          child: Container(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search ID".toUpperCase(),
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
            controller: txtData,
            validator: (value) {
              if (value!.isEmpty) {
                return "ตัวอย่าง M000X";
              }
              return null;
            },
          )),
        ),
      ),
      Container(
        width: 100,
        margin: EdgeInsets.only(top: 510.0, left: 140),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(29)),
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              dataTest = txtData.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStatefulWidget()),
              );
              print(txtData.text);
            } else {
              print('hello');
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('ไม่พบข้อมูล'),
                  content: const Text('กรุณากรอกใหม่อีกครั้ง'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('ตกลง'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('Submit'.toUpperCase()),
        ),
      )
    ]));
  }
}
