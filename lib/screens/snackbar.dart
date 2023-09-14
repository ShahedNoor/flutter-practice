import 'package:flutter/material.dart';

class SnackBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
      ),
      body: SnackBarPage()
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("Yep! This is a SnackBar, Click undo to go to home"),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Show a SnackBar"),
      ),
    );
  }
}
