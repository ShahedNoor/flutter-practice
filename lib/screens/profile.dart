import 'package:flutter/material.dart';
import 'package:practice/main.dart';
import 'package:practice/profiledata/jsonprofiledata.dart';
import 'package:provider/provider.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => MyApp(),
      },
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profiledata = Provider.of<ProfileData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                profiledata.profiledatalist[0]["name"],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Bio: ${profiledata.profiledatalist[0]["bio"]}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Who am I: ${profiledata.profiledatalist[0]["brief"]}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Languages I Know:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLanguageChip('English'),SizedBox(width: 10,),
                  _buildLanguageChip('Spanish'),SizedBox(width: 10,),
                  _buildLanguageChip('French'),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Add action for Facebook icon here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.wb_twighlight),
                    onPressed: () {
                      // Add action for Twitter icon here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.install_desktop),
                    onPressed: () {
                      // Add action for Instagram icon here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String language) {
    return Chip(
      label: Text(language),
      backgroundColor: Colors.blue,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}