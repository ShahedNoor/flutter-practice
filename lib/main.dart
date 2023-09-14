import 'package:flutter/material.dart';
// Screens
import 'package:practice/screens/cards.dart';
import 'package:practice/screens/route_page_1.dart';
import 'package:practice/screens/route_page_2.dart';
import 'package:practice/screens/alert_dialog.dart';
import 'package:practice/screens/snackbar.dart';
import 'package:practice/screens/toast.dart';
import 'package:practice/screens/textfield.dart';
import 'package:practice/screens/formfield.dart';
import 'package:practice/screens/increment_decrement_using_provider.dart';
import 'package:practice/screens/printlistdata.dart';
import 'package:practice/screens/profile.dart';
import 'package:practice/profiledata/jsonprofiledata.dart';
import 'package:practice/screens/text_from_free_json.dart';
import 'package:practice/screens/image_from_free_json.dart';
// Third party packages
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MapData()),
        ChangeNotifierProvider(create: (_)=> ProfileData()),
      ],
      child: MyApp()));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ==== Routing ====
      routes: {
        "/home": (context) => MyApp(),
        "/route_page_1": (context) => RoutePage1(),
        "/route_page_2": (context) => RoutePage2(),
        "/cards": (context) => Cards(),
        "/alert_dialog": (context) => AlertDialogs(),
        "/snack_bar": (context) => SnackBarExample(),
        "/toast": (context) => ToastExamplePage(),
        "/textfield": (context) => TextFieldExample(),
        "/formfield": (context) => FormFieldExample(),
        "/inc_dec_using_provider": (context) => IncDec(),
        "/printlistdata": (context) => PrintListDataExample(),
        "/profile": (context) => ProfileApp(),
        "/postapidata": (context) => ApiExample(),
        "/imageapidata": (context) => ImageApi(),
      },
      // ==== Theme Setup ====
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Practice"),
        ),
        // ==== Drawer ====
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Shahed Noor"),
                  accountEmail: Text("shahednoor28@gmail.com"),
                  currentAccountPicture: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 1
                        )
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile_avatar.png"),
                    ),
                  )),
              Builder(
                builder: (BuildContext context) {
                  return ListTile(
                    leading: Icon(Icons.route),
                    title: Text("Route Page 1"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/route_page_1");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.route),
                    title: Text("Route Page 2"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/route_page_2");
                      });
                    },
                  );
                }
              ),Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.grid_off_outlined),
                    title: Text("Cards"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/cards");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.add_alert),
                    title: Text('Alert Dialog'),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/alert_dialog");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.insert_invitation),
                    title: Text("Snack Bar"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/snack_bar");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.list_outlined),
                    title: Text("Toast"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/toast");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.text_fields),
                    title: Text('Text Field'),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/textfield");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.text_fields),
                    title: Text('Form Field'),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/formfield");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.text_increase),
                    title: Text('Increment Decrement Using Provider'),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/inc_dec_using_provider");
                      });
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.list_alt),
                    title: Text("Print List Data Using Provider"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/printlistdata");
                      });
                    },
                  );
                }
              ),
              Builder(
                  builder: (context) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                      onTap: () {
                        setState(() {
                          // ==== Navigation ====
                          Navigator.pushNamed(context, "/profile");
                        });
                      },
                    );
                  }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.api),
                    title: Text("Get posts from API"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/postapidata");
                      });
                    },
                  );
                }
              ),Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.api),
                    title: Text("Get images from API"),
                    onTap: () {
                      setState(() {
                        // ==== Navigation ====
                        Navigator.pushNamed(context, "/imageapidata");
                      });
                    },
                  );
                }
              ),
            ],
          ),
        ),
        // ==== Bottom Navigation ====
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Movies",
              icon: Icon(Icons.movie),
            ),
            BottomNavigationBarItem(
              label: "Web Series",
              icon: Icon(Icons.movie_filter),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: Center(
          child: Text("This is an experimental flutter app",)
        ),
      ),
    );
  }
}
