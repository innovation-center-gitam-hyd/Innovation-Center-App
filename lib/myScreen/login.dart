import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String> attemptLogIn(String username, String password) async {
    const String _url =
        "https://innovationcenter.gitam.edu/login/api/login.php";
    var res =
        await http.post(_url, body: {"email": username, "password": password});
    if (res.statusCode == 200) return json.decode(res.body)['jwt'];
    return null;
  }

  Future<String> errorLogIn(String username, String password) async {
    const String _url =
        "https://innovationcenter.gitam.edu/login/api/login.php";
    var res =
        await http.post(_url, body: {"email": username, "password": password});
    return json.decode(res.body)['message'];
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFfffafa),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.height / 4,
                            child: Image.asset('assets/images/IC_Logo.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text(
                                "INNOVATION CENTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'TimesNewRoman',
                                  fontSize: 23,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: '\tEMAIL',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black45,
                                size: 18,
                              )),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: '\tPASSWORD',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black45,
                              size: 18,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20),
                          child: InkWell(
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.black,
                      elevation: 7,
                      onPressed: () async {
                        var _jwt = await attemptLogIn(
                            _usernameController.text, _passwordController.text);
                        print(_jwt);
                        if (_jwt != null) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString("jwt", _jwt);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyDashboard()));
                        } else {
                          var _err = await errorLogIn(_usernameController.text,
                              _passwordController.text);
                          displayDialog(context, "An Error Occurred", "$_err");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
