import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<RegisterStatus> RegisteAnAccount(
    String username, String password) async {
  final response = await http.get(
      'http://139.162.10.98:85/register?username=' +
          username +
          '&password=' +
          password);

  if (response.statusCode == 200) {
    print(response.body);
    var resultregister = RegisterStatus(json.decode(response.body));
    return resultregister;
  } else {
    throw Exception('can not load');
  }
}

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPage1();
  }
}
class SignupPage1 extends State<SignupPage> {
  String status = "Fill infomation";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController repasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(status),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: false,
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: false,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: false,
                controller: repasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Re-type Password',
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    if (passwordController.text == repasswordController.text) {
                      Future<RegisterStatus> register = RegisteAnAccount(
                          usernameController.text, passwordController.text);
                      register
                          .then((value) =>
                          setState(() {
                            if (value.status == "OK") {
                              status = value.message;
                              //Navigator.push(
                              //  context,
                              //  MaterialPageRoute(
                              //      builder: (context) => PageHome()),
                              //);
                            }
                          }))
                          .catchError((error) => status = error);
                    }else{
                      setState(() {
                        status = "Password no same";
                      });
                    }
                  },
                  child: Text('Signup', style: TextStyle(fontSize: 20)),
                )),
          ],
        ),
      ),
    );
  }
}

class RegisterStatus {
  String status;
  String message;
  RegisterStatus(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
  }
}