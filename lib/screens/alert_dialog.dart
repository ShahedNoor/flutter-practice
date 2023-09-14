import 'package:flutter/material.dart';

class AlertDialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: Center(
          child: DialogExample()
      ),
    );
  }
}

class DialogExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Hey! This is a alert dialog'),
          content: Text('Click ok to go to Homepage, otherwise you can cancel!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
                },
              child: Text('OK'),
            ),
          ],
        ),
      ),
      child: Text('Show Dialog'),
    );
  }
}