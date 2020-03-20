import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SupportPage extends StatefulWidget {
//  SupportPage({
//    this.username,
//    this.title
//  });

//  final String title;
//  final String username;

  @override
  State<StatefulWidget> createState() {
    return SupportPage1();
  }
}
class SupportPage1 extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Hỗ trợ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Mọi thông tin trợ giúp xin liên hệ:\nTổng đài:1900.2888\nEmail hỗ trợ: 1900@gmail.com\nKế toán thu thuế VAT: ..."),
          ],
        ),
      ),
    );
  }
}