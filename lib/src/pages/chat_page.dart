import 'dart:io';

import 'package:chat_app/src/components/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasText = false;

  List<ChatMessage> _messages =[
    ChatMessage(uid: '123', text: 'Hola Mundo',),
    ChatMessage(uid: '12', text: 'Hola Mundo',),
    ChatMessage(uid: '123', text: 'Hola Mundo',),
    ChatMessage(uid: '12', text: 'Hola Mundo',),
    ChatMessage(uid: '123', text: 'Hola Mundo',),
    ChatMessage(uid: '123', text: 'Hola Mundo',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            CircleAvatar(
              child: const Text(
                "Te",
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            const Text("Emanuel",
                style: TextStyle(color: Colors.black87, fontSize: 12))
          ],
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app, color: Colors.black87)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[400],
            ),
            //child: Icon (Icons.offline_bolt, color: Colors.red[400],),
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(child: _list()),
          const Divider(height: 1),
          _inputChat()
        ],
      )),
    );
  }

  _list() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _messages[index];
        },
        reverse: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: _messages.length);
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Flexible(
                child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmit,
              onChanged: (text) {
                setState(() {
                  if (text.trim().length > 0) {
                    _hasText = true;
                  } else {
                    _hasText = false;
                  }
                });
              },
              decoration:
                  const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: _focusNode,
            )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Platform.isIOS
                    ? CupertinoButton(
                        child: const Text('Enviar'),
                        onPressed: () {},
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                            color: _hasText
                              ? Colors.blue[400]
                              : null,
                          ),
                          onPressed: _hasText
                              ? () => _handleSubmit(_textController.text.trim())
                              : null,
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    print(text);
    _textController.clear();
      _focusNode.requestFocus();
      final newMessage = ChatMessage(uid: '123', text: text);
      _messages.insert(0, newMessage);
    setState(() {
      _hasText = false;
    });
  }
}
