import 'package:easy_budget/send.dart';
import 'package:easy_budget/settings.dart';
import 'package:easy_budget/spend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/user.dart';
import 'dart:math';

import 'movement_list.dart';

void main() {
  runApp(MyApp());
}

TextStyle textStyle1 = TextStyle(
  fontSize: 16,
  color: Colors.grey.shade800,
  fontWeight: FontWeight.w400,
);
TextStyle budgetStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.grey.shade400, brightness: User.themeMode),
      title: 'Budget App',
      routes: {
        '/': (context) => MainPage(),
        '/settings': (context) => Settings(),
        '/send': (context) => Send(),
        '/spend': (context) => Spend(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  var user = User('Onur', 9750);

  Widget lastSendContainer(movType, movMoney, movTime) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 5),
      height: 75,
      decoration: BoxDecoration(
        // color: Colors.purple[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movType,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(movTime, style: TextStyle(fontWeight: FontWeight.w300))
            ],
          ),
          Text('$movMoney \$'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 110,
              // color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    child: Image(
                        image: AssetImage('assets/images/avatar.png'),
                        alignment: Alignment.center,
                        fit: BoxFit.cover),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: TextButton(
                      onPressed: () async {
                        final bool colorMode = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings()));

                        setState(() {
                          user.userThemeMode(colorMode);
                        });
                      },
                      child: Icon(
                        Icons.settings,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, maxHeight: 200),
              child: Container(
                // color: Colors.amber,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 13),
                      width: 250,
                      child: Text(
                        'Varolan Birikiminiz',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: 275,
                      child: Text(
                        '${user.totalBalance} \$ ',
                        style: budgetStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, maxHeight: 200),
              child: Container(
                // color: Colors.purple,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final int result = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Send()));

                          setState(() {
                            user.updateUserBalance(result);
                            user.updateMovements(
                                'Eraya Gonderilen para', result);
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue.shade200,
                                size: 40,
                              ),
                            ),
                            Text('Gönder'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade200,
                          minimumSize: Size(60, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Spend()));

                          setState(() {
                            user.updateMovements(result[0], result[1]);
                            user.updateUserBalance(result[1]);
                          });
                        },
                        child: Icon(Icons.arrow_back),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade200,
                          minimumSize: Size(60, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        user.calcPnl();
                        var userList = [
                          user.movements,
                          user.totalBalance,
                          user.totalPnl
                        ];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovList(userList)));
                      },
                      child: Icon(
                        Icons.account_balance_wallet_sharp,
                        color: Colors.grey.shade200,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade200,
                          minimumSize: Size(60, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, maxHeight: 320),
              child: Container(
                // color: Colors.purple,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Son İşlemler',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    lastSendContainer(
                        user.lastSendsList[0]['type'],
                        user.lastSendsList[0]['money'],
                        user.lastSendsList[0]['time']),
                    lastSendContainer(
                        user.lastSendsList[1]['type'],
                        user.lastSendsList[1]['money'],
                        user.lastSendsList[1]['time']),
                    lastSendContainer(
                        user.lastSendsList[2]['type'],
                        user.lastSendsList[2]['money'],
                        user.lastSendsList[2]['time']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
