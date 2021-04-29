import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';

class User {
  String name;
  int totalBalance;
  int totalPnl;
  static bool isSwitch = false;
  static Brightness themeMode = Brightness.light;

  List movements = [];
  List lastSendsList = [];
  var movement = Map();

  var movement1 = {'type': 'Alisveris', 'money': -710, 'time': '5.20 PM'};
  var movement2 = {'type': 'Mutfak', 'money': -550, 'time': '7.50 AM'};
  var movement3 = {'type': 'Araba Taksidi', 'money': -2100, 'time': '3.15 PM'};
  var movement4 = {'type': 'Kira', 'money': -1550, 'time': '11.15 AM'};
  var movement5 = {'type': 'Eğlence', 'money': -250, 'time': '6.10 PM'};
  var movement6 = {'type': 'Maaş', 'money': 4600, 'time': '8.20 PM'};
  var movement7 = {'type': 'Freelance İş', 'money': 550, 'time': '11.55 AM'};
  var movement8 = {'type': 'Ev Taksiti', 'money': -1750, 'time': '9.25 PM'};

  User(name, totalBalance) {
    this.name = name;
    this.totalBalance = totalBalance;
    this.movements.add(movement1);
    this.movements.add(movement2);
    this.movements.add(movement3);
    this.movements.add(movement4);
    this.movements.add(movement5);
    this.movements.add(movement6);
    this.movements.add(movement7);
    this.movements.add(movement8);
    lastSends();
  }

  lastSends() {
    this.lastSendsList.clear();
    var movLen = movements.length;
    this.lastSendsList.add(movements[movLen - 1]);
    this.lastSendsList.add(movements[movLen - 2]);
    this.lastSendsList.add(movements[movLen - 3]);
  }

  updateUserBalance(int value) {
    this.totalBalance += value;
  }

  updateMovements(type, money) {
    var mov = {
      'type': type,
      'money': money,
      'time': '5.50 PM',
    };

    this.movements.add(mov);
    this.lastSends();
  }

  calcPnl() {
    totalPnl = 0;
    for (var i = 0; i < movements.length; i++) {
      totalPnl += movements[i]['money'];
    }
    debugPrint(totalPnl.toString());
  }

  userThemeMode(bool switcher) {
    if (switcher) {
      themeMode = Brightness.dark;
    } else {
      themeMode = Brightness.light;
    }
  }
}
