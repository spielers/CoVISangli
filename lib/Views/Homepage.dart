import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Userdat extends StatefulWidget {
  Userdat({Key key}) : super(key: key);

  @override
  _UserdatState createState() => _UserdatState();
}

class _UserdatState extends State<Userdat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sangli Covid Info',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.black87,
        //   ),
        // onPressed: () {Drawer(),}),
        // ),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.solidEnvelope,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: Colors.black87,
              ),
              onPressed: () {}),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
              Text("Shivbhojan Thali"),
              Container(
                child: Text("Sangli Covid data"),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Sangli Covid'),
              // onTap: () {
              //   Navigator.of(context).pop(),
              // }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Shiv Bhojan'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('About us'),
            ),
          ],
        ),
      ),
    );
  }
}
