import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function() ontap;
  final String label;
  final Color backgroundColor;

  const ButtonComponent(
      {Key? key, 
      required this.ontap, 
      required this.label, 
      required this.backgroundColor})
      : super(key: key);
  // const ButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => ontap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: backgroundColor,
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 40,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
