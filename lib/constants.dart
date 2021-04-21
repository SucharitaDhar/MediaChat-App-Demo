import 'package:flutter/material.dart';

bool lightMode = true;

const kPrimaryColor = Color(0xFFC33EA3);
const kSecondaryColor = Color(0xFFFE9901);
const kColorLightTheme = Color(0xFF1D1D35);
const kColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
var kReceivedMessageColor = kPrimaryColor.withOpacity(0.1);

const kDefaultPadding = 20.0;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kAppNameStyle = TextStyle(
  fontFamily: 'Pacifico',
  fontSize: 50,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);

const kProfileNameStyle = TextStyle(
  fontFamily: 'Pacifico',
  fontSize: 25,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);

var kProfileAboutStyle = TextStyle(
  fontFamily: 'Source Sans Pro',
  color: kPrimaryColor.withOpacity(0.5),
  fontSize: 20.0,
  letterSpacing: 2.5,
  fontWeight: FontWeight.bold,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
);

const kFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kListTileTextStyle = TextStyle(fontSize: 20, color: Colors.grey);
