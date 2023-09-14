import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: ToastExample()
    );
  }
}

class ToastExample extends StatefulWidget {
  const ToastExample({super.key});

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                child: Text('Show Short Toast'),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            ),
          ),Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                child: Text('Show Short Toast'),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Long Toast",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            ),
          ),Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                child: Text('Show Short Toast'),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Long Toast",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP_LEFT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            ),
          ),Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                child: Text('Show Short Toast'),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Hello, World!",
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.indigo,
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}