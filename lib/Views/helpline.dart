import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLine extends StatelessWidget {
  const HelpLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "24/7 HelpLine",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Ambulance - 108"),
                  leading: Icon(
                    FontAwesomeIcons.ambulance,
                    color: Colors.red.shade300,
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () async {
                    final url = 'tel:108';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url :(';
                    }
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Sangli Control Room"),
                  leading: Icon(
                    FontAwesomeIcons.handsHelping,
                    color: Colors.green.shade300,
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () async {
                    final url = 'tel:02332373032';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url :(';
                    }
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Kolhapur Control Room"),
                  leading: Icon(
                    FontAwesomeIcons.handsHelping,
                    color: Colors.green.shade300,
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () async {
                    final url = 'tel:02312659232';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url :(';
                    }
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Solapur Control Room"),
                  leading: Icon(
                    FontAwesomeIcons.handsHelping,
                    color: Colors.green.shade300,
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () async {
                    final url = 'tel:02172310745';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url :(';
                    }
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Satara Control Room"),
                  leading: Icon(
                    FontAwesomeIcons.handsHelping,
                    color: Colors.green.shade300,
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () async {
                    final url = 'tel:02162233025';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url :(';
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
