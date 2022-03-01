import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mornad/data.dart';
import 'package:mornad/main.dart';

String id2Patient = '';

void main() {
  runApp(Second());
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MORNAD',
      home: Second(),
    );
  }
}

Future<Userdata> fetchPatient(id) async {
  final response = await http
      .get(Uri.parse('https://mornad.herokuapp.com/api/mornad/' + id));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Userdata.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Future<Userdata> futurePatient;
  final _formKey = GlobalKey<FormState>();
  // final ID2Data = TextEditingController();

  @override
  void initState() {
    super.initState();
    futurePatient = fetchPatient(dataTest);
    print(futurePatient.toString());
  }

  Widget build(BuildContext context) {
    return FutureBuilder<Userdata>(
      future: futurePatient,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          id2Patient = snapshot.data!.idPatient.toString();
          print('chack');
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              child: Column(
                key: _formKey,

                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  ListTile(
                    title: Text("ชื่อ-สกุล"),
                    subtitle: Text(snapshot.data!.namePatient.toString()),
                  ),
                  ListTile(
                    title: Text("เลขการรักษา"),
                    subtitle: Text(snapshot.data!.id.toString()),
                  ),
                  ListTile(
                    title: Text("เข้ารักษาเมื่อ"),
                    subtitle: Text(snapshot.data!.date),
                  ),
                  ListTile(
                      title: Text("เลขประจำตัวประชาชนคนไข้"),
                      subtitle: Text(snapshot.data!.idPatient.toString())),
                  ListTile(
                      title: Text("เลขประจำตัวหมอ"),
                      subtitle: Text(snapshot.data!.idDoctor.toString())),
                  ListTile(
                      title: Text("ชื่อคนไข้"),
                      subtitle: Text(snapshot.data!.namePatient)),
                  ListTile(
                      title: Text("ชื่อหมอ"),
                      subtitle: Text(snapshot.data!.nameDoctor)),
                  ListTile(
                      title: Text("อาการคนไข้"),
                      subtitle: Text(snapshot.data!.symptom)),
                  ListTile(
                      title: Text("วันนัดครั้งถัดไป"),
                      subtitle: Text(snapshot.data!.nextDate.toString())),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          print("${snapshot.error}");

          return AlertDialog(
            title: const Text('ไม่พบข้อมูล'),
            content: const Text('กรุณากรอกใหม่อีกครั้ง'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('ตกลง'),
              ),
            ],
          );

          // Text("ไม่พบข้อมูล");
        }
        // print(snapshot.data!.date.runtimeType);
        // print('hello');

        // By default, show a loading spinner.

        return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
