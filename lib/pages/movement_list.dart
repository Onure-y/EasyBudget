import 'package:easy_budget/Widgets/navbar.dart';
import 'package:easy_budget/data/user_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovListState();
  }
}

class MovListState extends State<MovList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                navBar(context, 'Tüm Hareketler'),
                Container(
                  width: 250,
                  padding: EdgeInsets.all(30.0),
                  margin: EdgeInsets.all(30.0),
                  child: totalBalance(),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(230, 230, 230, 0.5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes // Shadow position
                      ),
                    ],
                  ),
                ),
                allMovements(),
              ],
            )),
      ),
    );
  }
}
