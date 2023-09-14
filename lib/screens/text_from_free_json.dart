import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  Map? storeApiData;
  List<dynamic> userData = [];

  dynamic url = "https://jsonplaceholder.typicode.com/posts";
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> responseData = jsonDecode(response.body);

    setState(() {
      userData = responseData;
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Post API Example"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      width: 350,
                        child: Text("ID: ${userData[index]["id"]}\nPost title: ${userData[index]["title"]} \nPost Body: ${userData[index]["body"]}"))
                  ],
                ),
              );
        },
        ),
      ),
    );
  }
}
