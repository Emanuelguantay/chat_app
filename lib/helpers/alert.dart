import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String subTitle) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subTitle),
              actions: [
                MaterialButton(
                    child: const Text('Aceptar'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  } else {
    showCupertinoDialog(
      context: context, 
      builder: (_) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(subTitle),
        actions: [
                CupertinoDialogAction(
                    child: const Text('Aceptar'),
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context))
              ],
      )
    );
  }
}
