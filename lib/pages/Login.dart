import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_by_bus/router.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus +"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            router.navigateTo(context, "/howItWorks");
          },
        )
      ]),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment(0.0, 0.0),
          height: double.maxFinite,
          decoration: BoxDecoration(),
          child: Column(children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.1,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Welcome again!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Form(
                      child: TextFormField(
                        controller: _mailController,
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Form(
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: FlatButton(
                      child: Text("Login"),
                      onPressed: () {
                        router.navigateTo(context, "/home");
                      },
                      color: Colors.lightGreen,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "New user?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: FlatButton(
                      child: Text("Sign Up"),
                      onPressed: () {},
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.1,
              ),
            ),
            Container(
              child: ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.1,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
