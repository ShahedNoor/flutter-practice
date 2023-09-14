import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageApi extends StatefulWidget {
  const ImageApi({super.key});

  @override
  State<ImageApi> createState() => _ImageApiState();
}

class _ImageApiState extends State<ImageApi> {
  Map? storeApiData;
  List<dynamic> userData = [];

  dynamic url = "https://jsonplaceholder.typicode.com/photos";
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Image API Example"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[0]["url"]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[1]["url"]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[2]["url"]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[3]["url"]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[4]["url"]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.network(userData[5]["url"]),
          ),
        ],
      ),
    );
  }
}
