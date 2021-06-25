import 'package:flutter/material.dart';

Widget settingsTab(context, contextTo, text) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, contextTo);
    },
    child: Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Icon(Icons.arrow_right_alt_sharp),
        ],
      ),
    ),
  );
}
