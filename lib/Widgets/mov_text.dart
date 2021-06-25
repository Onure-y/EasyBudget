import 'package:flutter/material.dart';

Widget movText(text) {
  return Container(
    width: double.infinity,
    height: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0.5),
      ),
    ),
    child: Text('$text',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
  );
}
