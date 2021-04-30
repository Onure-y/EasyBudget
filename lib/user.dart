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

  var movement1 = {'type': 'Alisveris', 'money': -710, 'time': '21.20'};
  var movement2 = {'type': 'Mutfak', 'money': -550, 'time': '7.50'};
  var movement3 = {'type': 'Araba Taksidi', 'money': -2100, 'time': '9.15'};
  var movement4 = {'type': 'Kira', 'money': -1550, 'time': '17.15'};
  var movement5 = {'type': 'Eğlence', 'money': -250, 'time': '6.10'};
  var movement6 = {'type': 'Maaş', 'money': 4600, 'time': '8.20'};
  var movement7 = {'type': 'Freelance İş', 'money': 550, 'time': '11.55'};
  var movement8 = {'type': 'Ev Taksiti', 'money': -1750, 'time': '19.25'};

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

  updateMovements(type, money, time) {
    var mov = {
      'type': type,
      'money': money,
      'time': time,
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
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }
}
