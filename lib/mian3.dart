import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mornad/main.dart';
import 'package:mornad/main2.dart';

import 'datapatient.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp2());
}

// สร้าง widget
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MORNAD',
      home: Myhomepage2(),
      theme: ThemeData(primaryColor: Colors.teal.shade400),
    );
  }
}

class Myhomepage2 extends StatefulWidget {
  @override
  _Myhomepage2State createState() => _Myhomepage2State();
}

//get API
Future<IdData> fetchIdData(id) async {
  final response = await http
      .get(Uri.parse("https://mornad.herokuapp.com/api/patient/" + id));

  if (response.statusCode == 200) {
    // print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return IdData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// void _onItemTapped(int index) {
//   // setState(() {
//   //   _selectedIndex = index;
//   // });
// }

class _Myhomepage2State extends State<Myhomepage2> {
  late Future<IdData> patientOne;

  @override
  void initState() {
    super.initState();
    patientOne = fetchIdData(id2Patient);
    print(patientOne.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today_rounded),
      //       label: 'การนัด',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.qr_code_2),
      //       label: 'QRCODE',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'ข้อมูลคนไข้',
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
      // appBar: AppBar(
      //   title: Text("รายละเอียดข้อมูลคนไข้"),
      // ),

      body: FutureBuilder<IdData>(
        future: patientOne,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('hello');

            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text("เลขบัตรประจำตัวประชาชน"),
                  subtitle: Text(snapshot.data!.id.toString()),
                ),
                ListTile(
                  title: Text("ชื่อ-สกุล"),
                  subtitle: Text(snapshot.data!.name),
                ),
                ListTile(
                    title: Text("อายุ"),
                    subtitle: Text(snapshot.data!.age.toString())),
                ListTile(
                    title: Text("น้ำหนัก"),
                    subtitle: Text(snapshot.data!.weight.toString())),
                ListTile(
                    title: Text("ที่อยู่"),
                    subtitle: Text(snapshot.data!.address)),
                ListTile(
                    title: Text("หมู่เลือด"),
                    subtitle: Text(snapshot.data!.bloodGroup)),
                ListTile(
                    title: Text("การแพ้ยา"),
                    subtitle: Text(snapshot.data!.underlyingDisease)),
                ListTile(
                    title: Text("โรคประจำตัว"),
                    subtitle: Text(snapshot.data!.allergic)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          // return CircularProgressIndicator();
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),

      // body: Column(
      //   children: [LinearProgressIndicator(), Text("none")],
      // )
    );
  }
}
