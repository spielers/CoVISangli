import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
      ),
      body: Container(
        //"We give our best efforts to give ongoing precise information however we are heavily rely on external data for it. We can't ensure accuracy of the information. We ask visitors to check the realness and exactness all alone prior to taking any decisions. We are a volunteer group that is attempting to assist the citizens with as much accessible data as possible. We are not answerable for the actual information. If it's not too much trouble, tweet us with any criticism/ideas/adjustments/feedback at"
        child: Column(
          children: <Widget>[
            // Card(
            //   margin: EdgeInsets.all(10),
            //   elevation: 3,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Container(
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(20),
            //         color: Colors.white,
            //       ),
            //       child: ListTile(
            //         title: Text('Suraj Patil'),
            //         subtitle: Text('Devloper'),
            //         leading: Image.asset('assets/SurajPatil.png'),
            //       )),
            // ),
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
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Suraj Patil'),
                        subtitle: Text('Devloper'),
                        leading: Image.asset('assets/SurajPatil.png'),
                      ),
                      Row(
                        children: [
                          IconButton(
                            hoverColor: Colors.red,
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.blue.shade400,
                            ),
                            onPressed: () async {
                              String twitUrl =
                                  "https://twitter.com/indian_anton";
                              if (await canLaunch(twitUrl)) {
                                await launch(twitUrl);
                              } else {
                                throw 'could not launch $twitUrl :(';
                              }
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            hoverColor: Colors.red,
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.redAccent.shade400,
                            ),
                            onPressed: () async {
                              String twitUrl =
                                  "https://www.instagram.com/mr.srj_/";
                              if (await canLaunch(twitUrl)) {
                                await launch(twitUrl);
                              } else {
                                throw 'could not launch $twitUrl :(';
                              }
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            hoverColor: Colors.red,
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.black87,
                            ),
                            onPressed: () async {
                              String twitUrl = "https://github.com/spielers";
                              if (await canLaunch(twitUrl)) {
                                await launch(twitUrl);
                              } else {
                                throw 'could not launch $twitUrl :(';
                              }
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            hoverColor: Colors.red,
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.blue.shade400,
                            ),
                            onPressed: () async {
                              String twitUrl =
                                  "https://www.linkedin.com/in/surajpatil-me/";
                              if (await canLaunch(twitUrl)) {
                                await launch(twitUrl);
                              } else {
                                throw 'could not launch $twitUrl :(';
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
