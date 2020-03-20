import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FeedbackPage extends StatefulWidget {
//  SupportPage({
//    this.username,
//    this.title
//  });

//  final String title;
//  final String username;

  @override
  State<StatefulWidget> createState() {
    return FeedbackPage1();
  }
}
class FeedbackPage1 extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Phản hồi'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text("Chúng tôi đánh giá và trân trọng phản hồi của bạn"),
            Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  ),
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {},
                child: const Text('Bottom Button!', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}