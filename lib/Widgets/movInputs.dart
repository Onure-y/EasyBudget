import 'package:flutter/material.dart';
import 'package:easy_budget/data/user_data.dart';

Widget movInputs(typeController, valueController, context, spend, hintText) {
  return Container(
    padding: EdgeInsets.all(30.0),
    child: Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          controller: typeController,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade700),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: valueController,
          decoration: InputDecoration(
            hintText: '\$ 0',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade700),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            newMovement(
                typeController.text, valueController.text, context, spend);
          },
          child: Text(
            'Gonder',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 5,
          ),
        ),
      ],
    ),
  );
}
