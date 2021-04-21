import 'package:media_chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:media_chat_app/screens/profile.dart';
import 'components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:media_chat_app/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:media_chat_app/theme.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Widget> _children = [
    Body(),
    Profile(),
  ];

  bool darkModeEnabled = false;
  IconData modeIcon = Icons.bedtime;
  String modeText = 'Dark Mode';
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: buildAppBar(),
      drawer: Drawer(
          child: Column(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: kPrimaryColor,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/user_2.png"))),
                  ),
                  SizedBox(width: 15),
                  Text(
                    loggedinUser.email,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(modeIcon),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(modeText, style: kListTileTextStyle),
            ),
            onTap: () {
              setState(() {
                if (darkModeEnabled == false) {
                  darkModeEnabled = true;
                  modeIcon = Icons.wb_sunny;
                  modeText = 'Light Mode';
                  themeChanger.setTheme(darkThemeData(context));
                } else {
                  darkModeEnabled = false;
                  modeIcon = Icons.bedtime;
                  modeText = 'Dark Mode';
                  themeChanger.setTheme(lightThemeData(context));
                }
              });
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.settings),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text('Settings', style: kListTileTextStyle),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.logout),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Logout', style: kListTileTextStyle),
            ),
            onTap: () {},
          )
        ],
      )),
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        onPressed: () {
          // Add a friend
        },
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // Build BottomNavigationBar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        // BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friends"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  // Build AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: Text("Messages"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
