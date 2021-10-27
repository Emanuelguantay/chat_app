import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {

  const LogoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/tag-logo.png'),
            alignment: Alignment.center,
            height: 100,
            width: 150,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Messenger", style: TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}
