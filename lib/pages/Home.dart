import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:geolocator/geolocator.dart';

import 'package:smart_city_by_bus/router.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int _points = 0;
  bool _scanning = false;
  var _checkInCoords = {};

  var geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _main(BuildContext context) {
    Column _col = Column(
      children: <Widget>[
        Expanded(
          child: FractionallySizedBox(
            heightFactor: 0.1,
          ),
        ),
        Text(
          "Your Points: $_points",
          style: TextStyle(fontSize: 40),
        ),
        Expanded(
          child: FractionallySizedBox(
            heightFactor: 0.1,
          ),
        ),
        FloatingActionButton.extended(
          heroTag: "2",
          label: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Scan now!",
              style: TextStyle(fontSize: 40),
            ),
          ),
          elevation: 4.0,
          onPressed: () {
            setState(() {
              _scanning = true;
            });
            FlutterNfcReader.read().then((response) {
              //print(response.id);
              setState(() {
                _scanning = false;
              });
              StreamSubscription<Position> positionStream = geolocator
                  .getPositionStream(locationOptions)
                  .listen((Position position) {
                setState(() {
                  _checkInCoords["lat"] = position.latitude.toString();
                  _checkInCoords["long"] = position.longitude.toString();
                });

                print(position == null
                    ? 'Unknown'
                    : position.latitude.toString() +
                        ', ' +
                        position.longitude.toString());
              });
            });
          },
        ),
        Expanded(
          child: FractionallySizedBox(
            heightFactor: 0.1,
          ),
        ),
        FloatingActionButton.extended(
          heroTag: "1",
          icon: Icon(Icons.account_balance_wallet),
          label: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "redeem your points",
              style: TextStyle(fontSize: 15),
            ),
          ),
          elevation: 4.0,
          onPressed: () {
            router.navigateTo(context, "/redeem");
          },
        ),
        Expanded(
          child: FractionallySizedBox(
            heightFactor: 0.1,
          ),
        ),
      ],
    );

    List<Widget> widgets = [];
    widgets.add(_col);

    if (_scanning) {
      var modal = Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Waiting for Tag"),
                  trailing: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      );
      widgets.add(modal);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus +"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              router.navigateTo(context, "/howItWorks");
            },
          )
        ],
      ),
      body: Builder(
        builder: (context) => Container(
            alignment: Alignment(0.0, 0.0),
            height: double.maxFinite,
            decoration: BoxDecoration(

                /*gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Theme.of(context).accentColor,
                Theme.of(context).backgroundColor
              ])*/
                ),
            child: Stack(children: _main(context))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _switchTo,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              title: Text("Account"), icon: Icon(Icons.account_circle)),
          BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Settings"), icon: Icon(Icons.settings))
        ],
      ),
    );
  }

  void _switchTo(int index) {
    if (index == 0) {
      router.navigateTo(context, "/home");
    }
    if (index == 1) {
      router.navigateTo(context, "/home");
    }
    if (index == 2) {
      router.navigateTo(context, "/settings");
    }
  }
}
