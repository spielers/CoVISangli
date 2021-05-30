import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Terms extends StatelessWidget {
  const Terms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
      ),
      body: Container(
        //"We give our best efforts to give ongoing precise information however we are heavily rely on external data for it. We can't ensure accuracy of the information. We ask visitors to check the realness and exactness all alone prior to taking any decisions. We are a volunteer group that is attempting to assist the citizens with as much accessible data as possible. We are not answerable for the actual information. If it's not too much trouble, tweet us with any criticism/ideas/adjustments/feedback at"
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade100,
                ),
                child: Center(
                  child: Text(
                    "We give our best efforts to give ongoing precise information however we are heavily rely on external data for it. We can't ensure accuracy of the information. We ask visitors to check the realness and exactness all alone prior to taking any decisions. We are a volunteer group that is attempting to assist the citizens with as much accessible data as possible. We are not answerable for the actual information. Please, tweet or mail us with any criticism/ideas/adjustments/feedback",
                    style: TextStyle(
                      color: Colors.brown.shade700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue.shade400,
                  ),
                  onPressed: () async {
                    String twitUrl = "https://twitter.com/indian_anton";
                    if (await canLaunch(twitUrl)) {
                      await launch(twitUrl);
                    } else {
                      throw 'could not launch $twitUrl :(';
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.solidEnvelope,
                    color: Colors.red.shade400,
                  ),
                  onPressed: () async {
                    final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'gamitics@gmail.com',
                      query:
                          'subject= CoViSangli App Feedback&body=App Version 0.1.0', //add subject and body here
                    );

                    var url = params.toString();
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
            ActionChip(
              label: Text("Terms & Conditions"),
              onPressed: () async {
                String twitUrl = "https://covisangli.com/terms.html";
                if (await canLaunch(twitUrl)) {
                  await launch(twitUrl);
                } else {
                  throw 'could not launch $twitUrl :(';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
