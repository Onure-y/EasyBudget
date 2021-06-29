import 'package:easy_budget/Widgets/navbar.dart';
import 'package:easy_budget/data/user_data.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              navBar(context, 'Genel Bakis'),
            ],
          ),
        ),
      ),
    );
  }
}
