import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String? text;
  final String? uid;
  final AnimationController animationController;

  const ChatMessage(
      {Key? key, this.text, this.uid, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  _myMessage() {
    return Container(
        child: Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 5.0, bottom: 5.0, left: 50),
        child: Text(
          text ?? "",
          style: const TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: const Color(0xFF4D9EF6),
            borderRadius: BorderRadius.circular(20)),
      ),
    ));
  }

  _notMyMessage() {
    return Container(
        child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 50, bottom: 5.0, left: 5),
        child: Text(
          text ?? "",
          style: const TextStyle(color: Colors.black87),
        ),
        decoration: BoxDecoration(
            color: const Color(0xFFE4E5E8),
            borderRadius: BorderRadius.circular(20)),
      ),
    ));
  }
}
