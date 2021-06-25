import 'package:easy_budget/Widgets/navbar.dart';
import 'package:easy_budget/Widgets/settings_tab.dart';
import 'package:easy_budget/pages/login.dart';
import '../data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/main.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              navBar(context, 'Ayarlar'),
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    settingsTab(context, '/about', 'Hakkimizda'),
                    settingsTab(context, '/exchanges', 'Doviz kurlari'),
                    InkWell(
                      onTap: () async {
                        await auth.signOut();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Log out',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                            Icon(Icons.logout, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
