import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 10, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          //obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: 'Email'),
        ));
  }
}
