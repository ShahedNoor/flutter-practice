import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapData with ChangeNotifier {
  var name = "Name: ";
  var email = "Email: ";
  var age = "Age: ";
  dynamic list = [
    {
      "name": "Shahed Noor",
      "email": "shaednoor@gmail.com",
      "age": "21"
    },
    {
      "name": "Shishir",
      "email": "shishir@gmail.com",
      "age": "21"
    },
    {
      "name": "Asif",
      "email": "asif@gmail.com",
      "age": "21"
    },
  ];
}

class PrintListDataExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Print List Data Using Provider"),
        ),
        body: PrintListData()
    );
  }
}

class PrintListData extends StatefulWidget {
  const PrintListData({super.key});

  @override
  State<PrintListData> createState() => _PrintListDataState();
}

class _PrintListDataState extends State<PrintListData> {
  @override
  Widget build(BuildContext context) {
    var mapdata = Provider.of<MapData>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => MapData(),
      child: Scaffold(
        body: Center(
          child: Text(mapdata.name + mapdata.list[0]["name"] + "\n" + mapdata.email + mapdata.list[1]["email"] + "\n" + mapdata.age + mapdata.list[2]["age"]),
        ),
      ),
    );
  }
}
