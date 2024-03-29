
import 'package:flutter/material.dart';

alert(BuildContext context, String title, String message){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {Navigator.pop(context);},
            )
          ],
        );
      }
  );
}