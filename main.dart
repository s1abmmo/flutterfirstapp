import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'PageHome.dart';
import 'SignupPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  LoginPage createState() => LoginPage();
}

Future<LoginStatus> checkLogin(String username, String password) async {
  final response = await http.get(
      'http://139.162.10.98:85/login?username=' +username +'&password=' +password);

  if (response.statusCode == 200) {
    print(response.body);
    return LoginStatus(json.decode(response.body));
  } else {
    throw Exception('can not load');
  }
}

class LoginPage extends State<MainPage> {

  String status = "xin chao";
  LoginStatus loginstatus;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
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
              child: RaisedButton(
                onPressed: () {
                  print(
                      usernameController.text + " " + passwordController.text);
                  //Future<LoginStatus> logins =  checkLogin(usernameController.text, passwordController.text);
                  // logins.then((value) =>loginstatus=value).catchError((error) => status = error);
                  Future<LoginStatus> logins = checkLogin(usernameController.text, passwordController.text);
                  logins.then((value) => setState(() {
                            if (value.status == "OK") {
                              status = value.message;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageHome(title:"",username:usernameController.text)));
                            }else if(value.status == "ERROR"){
                              status = value.message;
                            }
                          }))
                      .catchError((error) => status = error);
                  //Navigator.push(
                   //context,
                   //MaterialPageRoute(builder: (context) => MyApp1()),
                   //);
                },
                child: Text('Sigin', style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    //SignupPage1 createState() => SignupPage1();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text('Signup', style: TextStyle(fontSize: 20)),
                )),
          ],
        ),
      ),
    );
  }
}

class AlbumList {
  final List<Album> albums;

  AlbumList({
    this.albums,
  });
}

class Album {
  int userId;
  int id;
  String title;

  Album(Map<String, dynamic> data) {
    userId = data['userId'];
    id = data['id'];
    title = data['title'];
  }
}

class LoginStatus {
  String status;
  String message;
  String token;
  LoginStatus(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
    token = data['token'];
  }
}

