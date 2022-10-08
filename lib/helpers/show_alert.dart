import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String subtitle) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                MaterialButton(
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'))
              ],
            ));
  }

  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          ));
}
