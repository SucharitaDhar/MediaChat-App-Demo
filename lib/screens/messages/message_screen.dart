import 'package:media_chat_app/constants.dart';
import 'package:flutter/material.dart';

import 'message_body.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({
    this.friendName,
    this.friendImagePath,
    this.lastSeenTime,
  });

  final String friendName;
  final String friendImagePath;
  final String lastSeenTime;

  @override
  _MessagesScreen createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final String imagePath = widget.friendImagePath;
    return Scaffold(
      appBar: buildAppBar(),
      body: MessageBody(imagePath: imagePath),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(widget.friendImagePath),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.friendName,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                widget.lastSeenTime,
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
