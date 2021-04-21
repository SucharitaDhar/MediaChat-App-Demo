import 'package:flutter/material.dart';
import 'package:media_chat_app/constants.dart';
import 'package:media_chat_app/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:media_chat_app/theme.dart';
// import 'package:media_chat_app/main.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({this.userEmail});

  final String userEmail;
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool darkModeEnabled;
  IconData modeIcon = Icons.bedtime;
  String modeText = 'Dark Mode';

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return Drawer(
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
                  widget.userEmail,
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
    ));
  }
}
