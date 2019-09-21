import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import 'package:smart_city_by_bus/router.dart';

class Redeem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RedeemState();
  }
}

class RedeemState extends State<Redeem> {
  int _points = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _main(BuildContext context) {
    Column _col = Column(children: [
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
      Card(
        child: ListTile(
          title: Text("PayBack Points"),
          trailing: Icon(Icons.redeem),
        ),
      ),
      Card(
        child: ListTile(
          title: Text("Amazon Gift Card"),
          trailing: Icon(Icons.redeem),
        ),
      ),
      Card(
        child: ListTile(
          title: Text("GYM Studio"),
          trailing: Icon(Icons.redeem),
        ),
      ),
      Card(
        child: ListTile(
          title: Text("..."),
          trailing: Icon(Icons.redeem),
        ),
      ),
      Card(
        child: ListTile(
          title: Text("..."),
          trailing: Icon(Icons.redeem),
        ),
      ),
      Expanded(
        child: FractionallySizedBox(
          heightFactor: 0.1,
        ),
      ),
    ]);
    List<Widget> widgets = [];
    widgets.add(_col);

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
      router.navigateTo(context, "/redeem");
    }
  }
}
