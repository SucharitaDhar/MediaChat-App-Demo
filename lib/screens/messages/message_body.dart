import 'package:flutter/material.dart';
import 'chat_input_field.dart';
import 'package:media_chat_app/components/message_box.dart';

class MessageBody extends StatelessWidget {
  MessageBody({this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Message(
          message: "Hello Natasha",
          isSender: false,
          imagePath: imagePath,
        ),
        Message(
          message: "Yes tell me",
          isSender: true,
        ),
        Message(
          message: "We need you at S.H.I.E.L.D.",
          isSender: false,
          imagePath: imagePath,
        ),
        Message(
          message: "Why ? What Happened ?!!?",
          isSender: true,
        ),
        Message(
          message: "Thanos is Back",
          isSender: false,
          imagePath: imagePath,
        ),
        Message(
          message: "Are you kidding me ? We killed him!",
          isSender: true,
        ),
        Message(
          message: "He came from a parallel universe",
          isSender: false,
          imagePath: imagePath,
        ),
        Message(
          message: "No way !! What now ?",
          isSender: true,
        ),
        Message(
          message: "Dunno, Just come now ! ",
          isSender: false,
          imagePath: imagePath,
        ),
        Message(
          message: "All right on my way !!",
          isSender: true,
        ),
        Message(
          message: "Bring Hawkeye along",
          isSender: false,
          imagePath: imagePath,
        ),
        ChatInputField(),
      ],
    );
  }
}
