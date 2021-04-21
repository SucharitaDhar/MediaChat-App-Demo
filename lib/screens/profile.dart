import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:media_chat_app/constants.dart';
import 'package:media_chat_app/screens/chats/chat_screen.dart';

class Profile extends StatefulWidget {
  static String id = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEditingTextName = false;
  // bool _isEditingTextAbout = false;

  TextEditingController _editingControllerName;
  // TextEditingController _editingControllerAbout;
  String name = "NATASHA ROMANOFF";
  // String about = "S.H.I.E.L.D Agent";

  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  @override
  void initState() {
    super.initState();
    _editingControllerName = TextEditingController(text: name);
    // _editingControllerName = TextEditingController(text: about);
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _editingControllerName.dispose();
    // _editingControllerAbout.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [], title: Text("Profile")),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          // Edit Name and About Capability
          ListTile(
            onTap: () {
              setState(() {
                _isEditingTextName = true;
              });
            },
            title: Center(child: _editTitleTextField('name')),
            trailing: Icon(Icons.edit),
          ),

          // Text(
          //   'NATASHA ROMANOFF',
          //   style: TextStyle(
          //     fontFamily: 'Pacifico',
          //     fontSize: 30,
          //     color: kPrimaryColor,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Text('S.H.I.E.L.D. Agent', style: kProfileAboutStyle),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: kPrimaryColor.withOpacity(0.3),
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: kPrimaryColor,
                ),
                title: Text(
                  '+91 123 456 789',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                title: Text(
                  loggedinUser.email,
                  style:
                      TextStyle(fontSize: 20.0, fontFamily: 'Source Sans Pro'),
                ),
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        onPressed: () {
          ChatScreen();
        },
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        // label: Text("Edit"),
      ),
    );
  }

  Widget _editTitleTextField(String card) {
    if (_isEditingTextName == true)
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              name = newValue;
              _isEditingTextName = false;
            });
          },
          autofocus: true,
          controller: _editingControllerName,
        ),
      );

    return InkWell(
      onTap: () {
        setState(() {
          _isEditingTextName = true;
        });
      },
      child: Text(name, style: kProfileNameStyle),
    );
  }
}
