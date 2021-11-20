import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? ontap;
  final String label;
  final Color backgroundColor;
  final bool isEnabled;

  const ButtonComponent(
      {Key? key, 
      this.ontap, 
      required this.label,
      required this.backgroundColor,
      this.isEnabled = true})
      : super(key: key);
  // const ButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => ontap!(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: ontap != null ? backgroundColor: Colors.grey,
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
