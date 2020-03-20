import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'SupportPage.dart';
import 'FeedbackPage.dart';

class PageHome extends StatefulWidget {
  PageHome({
    this.username,
    this.title
  });

  final String title;
  final String username;

  @override
  State<StatefulWidget> createState() {
    return PageHome1();
  }
}
class PageHome1 extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Text('Xin chào '+widget.username),
              ),
              new ListTile(
                leading: Icon(
                  Icons.add_alert,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Thông báo'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.business,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Nhận chuyến'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.monetization_on,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Bán chuyến'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Xe của tôi'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Thu nhập'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Tài khoản'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Cài đặt'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Chính sách và điều khoản'),
                onTap: () {},
              ),
              new ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Phản hồi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
              ),
              new ListTile(
                leading: Icon(
                  Icons.supervisor_account,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Hỗ trợ'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
              ),
              new Divider(),
              new ListTile(
                leading: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 30.0,
                ),
                title: new Text('Đăng xuất'),
                onTap: () {},
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello world"),
          ],
        ),
      ),
    );
  }
}