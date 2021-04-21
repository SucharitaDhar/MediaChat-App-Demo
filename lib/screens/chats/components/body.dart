import 'package:media_chat_app/models/Chat.dart';
//import 'package:media_chat_app/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:media_chat_app/screens/messages/message_screen.dart';

import 'message_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: messagesData.length,
          itemBuilder: (context, index) => MessageCard(
              chat: messagesData[index],
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesScreen(),
                    ),
                  )),
        ),
      ),
    ]);
  }
}
