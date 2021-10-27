import 'dart:io';

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
          return Text('$index');
        },
        reverse: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: 6);
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
              onChanged: (String text) {
                //TODO: Cuando hay valor postear
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
                          icon: Icon(Icons.send, color: Colors.blue[400],),
                          onPressed: () {},
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text){
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
  }
}
