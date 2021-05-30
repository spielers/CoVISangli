import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/Routes/routes.dart';
import 'package:url_launcher/link.dart';
import 'services.dart';
import 'hospitals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Debouncer {
  final int mili;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.mili});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: mili), action);
  }
}
// TODO : add search functionalities

class jsonfetch extends StatefulWidget {
  @override
  _jsonfetchState createState() => _jsonfetchState();
}

var refreshkey = GlobalKey<RefreshIndicatorState>();

class _jsonfetchState extends State<jsonfetch> {
  final _debouncer = Debouncer(mili: 500);
  List<Hospitals> _hospital;
  bool _loading;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isnormal = true;
  bool isAvailable = false;
  bool isMjpajay = false;
  List<Hospitals> _filtered;

  Future<void> refreshList() async {
    refreshkey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
    Services.getHospitals().then((hospitalo) {
      setState(() {
        _hospital = hospitalo;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getHospitals().then((hospitalo) {
      setState(() {
        _hospital = hospitalo;
        _loading = false;
        _filtered = _hospital;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Sangli Covid Info',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        actions: [
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
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              accountName: Text(
                'CoViSangli',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              accountEmail: Text('HelpIng Sangli To fight Covid-19'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            ListTile(
                leading: Icon(FontAwesomeIcons.bed),
                title: Text('Covid Hospitals'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(NavRoutes.homepage);
                }),
            Divider(),
            ListTile(
                leading: Icon(FontAwesomeIcons.cookie),
                title: Text('Shiv Bhojan'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(NavRoutes.tiffin);
                }),
            Divider(),
            ListTile(
                leading: Icon(FontAwesomeIcons.phoneSquareAlt),
                title: Text('24/7 HelpLine'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(NavRoutes.helpline);
                }),
            Divider(),
            ListTile(
              leading: Icon(FontAwesomeIcons.angleDoubleRight),
              title: Text('Terms & Conditions'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(NavRoutes.terms);
              },
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.code),
            //   title: Text('About us'),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.of(context).pushNamed(NavRoutes.aboutUs);
            //   },
            // ),
            SizedBox(height: 40),
            ListTile(
              title: Text('Suraj Patil'),
              subtitle: Text('Devloper'),
              leading: Image.asset('assets/SurajPatil.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  hoverColor: Colors.green.shade50,
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
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  hoverColor: Colors.green.shade50,
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.redAccent.shade400,
                  ),
                  onPressed: () async {
                    String twitUrl = "https://www.instagram.com/mr.srj_/";
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
                  hoverColor: Colors.green.shade50,
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
                  hoverColor: Colors.green.shade50,
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
            SizedBox(
              height: 40,
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        key: refreshkey,
        onRefresh: refreshList,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Link(
                  uri: Uri.parse(NavRoutes.homepage),
                  builder: (context, followLink) {
                    return ActionChip(
                      label: Text('Beds'),
                      onPressed: () {},
                      backgroundColor: Colors.blue.shade100,
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Link(
                  uri: Uri.parse(NavRoutes.tiffin),
                  target: LinkTarget.self,
                  builder: (context, followLink) {
                    return ActionChip(
                      label: Text('ShivBhojan Thali'),
                      onPressed: () {
                        //   Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(NavRoutes.tiffin);
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Link(
                  uri: Uri.parse(NavRoutes.tiffin),
                  target: LinkTarget.self,
                  builder: (context, followLink) {
                    return ActionChip(
                      label: Text('HelpLine'),
                      onPressed: () {
                        //   Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(NavRoutes.helpline);
                      },
                    );
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: CupertinoSearchTextField(
                placeholder: 'Search Hospital or tahasil',
                borderRadius: BorderRadius.circular(20),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      _filtered = _hospital
                          .where((h) =>
                              h.hospital
                                  .toLowerCase()
                                  .contains(string.toLowerCase()) ||
                              h.tahsil
                                  .toLowerCase()
                                  .contains(string.toLowerCase()) ||
                              h.administrativeOfficer
                                  .toLowerCase()
                                  .contains(string.toLowerCase()))
                          .toList();
                    });
                  });
                },
              ),
            ),
            Text(
              'Search by Hospital name, address or Tahasil eg: "Palus" ',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                FilterChip(
                  label: Text('All'),
                  labelStyle:
                      TextStyle(color: isnormal ? Colors.white : Colors.black),
                  selected: isnormal,
                  onSelected: (bool selected) {
                    _debouncer.run(() {
                      setState(() {
                        _filtered = _hospital;
                        isnormal = !isnormal;
                      });
                    });
                  },
                  selectedColor: Theme.of(context).backgroundColor,
                  checkmarkColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  label: Text('Available Only'),
                  labelStyle: TextStyle(
                      color: isAvailable ? Colors.white : Colors.black),
                  selected: isAvailable,
                  onSelected: (bool selected) {
                    _debouncer.run(() {
                      setState(() {
                        _filtered = _hospital
                            .where(
                                (h) => h.wardBeds.contains(RegExp(r'[1-99]')))
                            .toList();
                        isAvailable = selected;
                      });
                    });
                  },
                  selectedColor: Theme.of(context).backgroundColor,
                  checkmarkColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  label: Text('ICU Beds'),
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    _debouncer.run(() {
                      setState(() {
                        _filtered = _hospital
                            .where(
                                (h) => h.wardBeds.contains(RegExp(r'[1-99]')))
                            .toList();
                        isSelected = selected;
                      });
                    });
                  },
                  selectedColor: Theme.of(context).backgroundColor,
                  checkmarkColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  label: Text('Ward Beds'),
                  labelStyle: TextStyle(
                      color: isSelected1 ? Colors.white : Colors.black),
                  selected: isSelected1,
                  onSelected: (bool selected) {
                    _debouncer.run(() {
                      setState(() {
                        _filtered = _hospital
                            .where((h) =>
                                h.vacantBeds.compareTo(h.totalOccupancy) >= 1)
                            .toList();
                        isSelected1 = selected;
                      });
                    });
                  },
                  selectedColor: Theme.of(context).backgroundColor,
                  checkmarkColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                // FilterChip(
                //   label: Text('MJPJAY'),
                //   labelStyle:
                //       TextStyle(color: isMjpajay ? Colors.white : Colors.black),
                //   selected: isMjpajay,
                //   onSelected: (bool selected) {
                //     _debouncer.run(() {
                //       setState(() {
                //         _filtered = _hospital
                //             .where((h) => h.hospital.contains('MJPJAY'))
                //             .toList();
                //         isMjpajay = selected;
                //       });
                //     });
                //   },
                //   selectedColor: Theme.of(context).backgroundColor,
                //   checkmarkColor: Colors.black,
                // ),
              ],
            ),
            SizedBox(height: 10),
            Chip(
              label: Text(
                  "Data may be delayed or partial. Please verify with the hospital."),
              labelStyle: TextStyle(color: Colors.orange.shade700),
              backgroundColor: Colors.orange.shade50,
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 1200),
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: null == _filtered ? 0 : _filtered.length,
                  itemBuilder: (BuildContext context, int index) {
                    Hospitals hm = _filtered[index];
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    Text(hm.hospital,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ActionChip(
                                      label: Text('Get Direction'),
                                      labelStyle: TextStyle(
                                          color: Colors.green.shade800),
                                      onPressed: () async {
                                        String query =
                                            Uri.encodeComponent(hm.hospital);
                                        String googleUrl =
                                            "https://www.google.com/maps/search/?api=1&query=$query";
                                        if (await canLaunch(googleUrl)) {
                                          await launch(googleUrl);
                                        } else {
                                          throw 'could not launch $googleUrl :(';
                                        }
                                      },
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.green.shade600,
                                        child: Icon(
                                          Icons.navigation_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      backgroundColor: Colors.green.shade50,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Phone No: "),
                                    ActionChip(
                                      label: Text(hm.hospitalContactNo),
                                      labelStyle: TextStyle(
                                          color: Colors.blue.shade800),
                                      onPressed: () async {
                                        final url =
                                            'tel:' + hm.hospitalContactNo;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'could not launch $url :(';
                                        }
                                      },
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.blue.shade600,
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      backgroundColor: Colors.blue.shade50,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Contact: " + hm.administrativeOfficer),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Mobile No: "),
                                    ActionChip(
                                      label: Text(hm.contactNo),
                                      labelStyle: TextStyle(
                                          color: Colors.blue.shade800),
                                      onPressed: () async {
                                        final url = 'tel:+91' + hm.contactNo;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'could not launch $url :(';
                                        }
                                      },
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.blue.shade600,
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      backgroundColor: Colors.blue.shade50,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("ICU Beds",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 10)),
                                    Text("Ward Beds",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.white10,
                                      child: Row(
                                        children: [
                                          Chip(
                                            label: Text(hm.wardBeds,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: int.parse(
                                                                hm.wardBeds) >=
                                                            10
                                                        ? Colors.green.shade800
                                                        : Colors.red.shade800)),
                                            backgroundColor:
                                                int.parse(hm.wardBeds) >= 10
                                                    ? Colors.green.shade100
                                                    : Colors.red.shade100,
                                          ),
                                          Text(" / " + hm.icuBeds,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10)),
                                    Container(
                                      child: Row(
                                        children: [
                                          Chip(
                                            label: Text(
                                                (int.parse(hm.vacantBeds) -
                                                                int.parse(hm
                                                                    .totalOccupancy) >=
                                                            0
                                                        ? int.parse(hm.vacantBeds) -
                                                            int.parse(hm
                                                                .totalOccupancy)
                                                        : 0)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: (int.parse(hm.vacantBeds) -
                                                                int.parse(
                                                                    hm.totalOccupancy)) >=
                                                            10
                                                        ? Colors.green.shade800
                                                        : Colors.red.shade800)),
                                            backgroundColor: (int.parse(
                                                            hm.vacantBeds) -
                                                        int.parse(hm
                                                            .totalOccupancy)) >=
                                                    10
                                                ? Colors.green.shade100
                                                : Colors.red.shade100,
                                          ),
                                          Text(" / " + hm.vacantBeds,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
