import 'package:easy_budget/Widgets/movInputs.dart';
import 'package:easy_budget/Widgets/mov_text.dart';
import 'package:easy_budget/Widgets/navbar.dart';
import 'package:easy_budget/data/user_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Send extends StatelessWidget {
  TextEditingController valueController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  Color color1 = Color.fromRGBO(220, 220, 220, 0);
  Color color2 = Color.fromRGBO(220, 220, 220, 1);

  bool spend = true;

  @override
  Widget build(BuildContext context) {
    final double devicesHeight = MediaQuery.of(context).size.height;
    final double devicesWidht = MediaQuery.of(context).size.width;

    String text =
        'Lutfen harcamak istediginiz para miktarini harcama tipi ile birlikte giriniz';

    String hintText = 'Alisveris,Ev Taksiti....';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: devicesHeight * 0.01),
          child: Column(
            children: [
              navBar(context, 'Para Harca'),
              movText(text),
              movInputs(
                  typeController, valueController, context, spend, hintText),
            ],
          ),
        ),
      ),
    );
  }
}
