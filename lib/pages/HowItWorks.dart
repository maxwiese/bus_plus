import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_by_bus/router.dart';

class HowItWorks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HowItWorksState();
  }
}

class HowItWorksState extends State<HowItWorks> {
  int _points = 0;

  @override
  void initState() {
    super.initState();
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
          )]
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("How it works?", style: TextStyle(fontSize: 20),),
                Text("Here is the motto of life time!", style: TextStyle(fontSize: 16)),
                Text("You collect BUS+ point while traveling." , style: TextStyle(fontSize: 16)),
                Text("Spend BUS+ point to do your Thing.", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
