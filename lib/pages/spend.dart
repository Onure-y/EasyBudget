import 'package:easy_budget/Widgets/movInputs.dart';
import 'package:flutter/material.dart';
import '../Widgets/mov_text.dart';
import '../Widgets/navbar.dart';

class Spend extends StatelessWidget {
  TextEditingController typeInputController =
      new TextEditingController(text: '');
  TextEditingController moneyInputController =
      new TextEditingController(text: '');

  bool spend = false;

  String text =
      'Lutfen Eklemek istediginiz para miktarini tipiyle birlikte giriniz';

  String hintText = 'Maas,Freelance,Prim...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              navBar(context, 'Para Ekle'),
              movText(text),
              movInputs(typeInputController, moneyInputController, context,
                  spend, hintText),
            ],
          ),
        ),
      ),
    );
  }
}
