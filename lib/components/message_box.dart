import 'package:flutter/material.dart';
import 'package:media_chat_app/constants.dart';

class Message extends StatelessWidget {
  Message({this.message, this.isSender, this.imagePath});

  final bool isSender;
  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isSender) ...[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: kDefaultPadding / 2),
              ],
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                  vertical: kDefaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: isSender ? kPrimaryColor : kReceivedMessageColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isSender
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
              if (isSender) MessageStatusDot(),
            ],
          )),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
