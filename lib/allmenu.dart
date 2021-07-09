import 'package:flutter/material.dart';
import 'package:mornad/main.dart';
import 'package:mornad/main2.dart';

import 'mian3.dart';

void main() => runApp(const MyApp4());

/// This is the main application widget.
class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    SecondPage(),
    // HomePage3(),

    Myhomepage2()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Center(
            child: Text(
              'MORNAD',
              style: TextStyle(fontSize: 26),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                  (route) => false,
                );
              },
              icon: new Icon(Icons.exit_to_app_rounded),
            ),
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'การนัด',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.qr_code_2),
          //   label: 'QRCODE',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลคนไข้',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
