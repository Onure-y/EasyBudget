import 'package:flutter/material.dart';

Widget navBar(context, text) {
  return Row(
    children: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      Text(
        '$text',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
