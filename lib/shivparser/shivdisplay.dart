// TODO : write display function for shiv bhijan Thali

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Routes/routes.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'shiv.dart';
import 'shivservic.dart';

class Shivfetch extends StatefulWidget {
  @override
  _ShivfetchState createState() => _ShivfetchState();
}

class _ShivfetchState extends State<Shivfetch> {
  List<Thali> _thali;
  List<Thali> _filteredT;
  bool _loadingT;

  @override
  void initState() {
    super.initState();
    _loadingT = true;
    Shivservices.getThali().then((shivthali) {
      setState(() {
        _thali = shivthali;
        _loadingT = false;
        _filteredT = _thali;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text(
          "ShivBhojan Thali",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Wrap(
            children: [
              Link(
                uri: Uri.parse(NavRoutes.homepage),
                target: LinkTarget.self,
                builder: (context, followLink) {
                  return ActionChip(
                    label: Text('Beds'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      //   Navigator.of(context).pushNamed(NavRoutes.homepage);
                    },
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              Link(
                uri: Uri.parse(NavRoutes.tiffin),
                builder: (context, followLink) {
                  return ActionChip(
                    label: Text('ShivBhojan Thali'),
                    onPressed: () {},
                    backgroundColor: Colors.blue.shade100,
                  );
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: CupertinoSearchTextField(
              placeholder: 'District or villiage Name',
              borderRadius: BorderRadius.circular(20),
              onChanged: (string) {
                setState(() {
                  _filteredT = _thali
                      .where((th) =>
                          th.districtName
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          th.eateryName
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          th.address
                              .toLowerCase()
                              .contains(string.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          // Wrap(
          //   children: [
          //     FilterChip(
          //       label: Text('Available Only'),
          //       labelStyle:
          //           TextStyle(color: isAvailable ? Colors.white : Colors.black),
          //       selected: isAvailable,
          //       onSelected: (bool selected) {
          //         _debouncer.run(() {
          //           setState(() {
          //             _filtered = _hospital
          //                 .where((h) => h.wardBeds.contains(RegExp(r'[1-99]')))
          //                 .toList();
          //             isAvailable = selected;
          //           });
          //         });
          //       },
          //       selectedColor: Theme.of(context).backgroundColor,
          //       checkmarkColor: Colors.black,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),

          //   ],
          // ),
          SizedBox(height: 10),
          Chip(
            label: Text(
                "Navigation may be incorrect due to google maps hotels listing."),
            labelStyle: TextStyle(color: Colors.orange.shade700),
            backgroundColor: Colors.orange.shade50,
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1000),
              color: Colors.green.shade50,
              child: ListView.builder(
                itemCount: null == _filteredT ? 0 : _filteredT.length,
                itemBuilder: (BuildContext context, int index) {
                  Thali th = _filteredT[index];
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(th.eateryName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Address: " +
                                  th.address +
                                  ", " +
                                  th.districtName),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Distict: " + th.districtName),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Plates Limit: " + th.existingPlatesLimit),
                              SizedBox(
                                height: 10,
                              ),
                              ActionChip(
                                label: Text('Get Direction'),
                                labelStyle:
                                    TextStyle(color: Colors.blue.shade800),
                                onPressed: () async {
                                  String query =
                                      Uri.encodeComponent(th.eateryName);
                                  String googleUrl =
                                      "https://www.google.com/maps/search/?api=1&query=$query";
                                  if (await canLaunch(googleUrl)) {
                                    await launch(googleUrl);
                                  } else {
                                    throw 'could not launch $googleUrl :(';
                                  }
                                },
                                avatar: CircleAvatar(
                                  backgroundColor: Colors.blue.shade600,
                                  child: Icon(
                                    Icons.navigation_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                backgroundColor: Colors.blue.shade50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
