import 'package:flutter/material.dart';
import 'user.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsWidgetState();
  }
}

class SettingsWidgetState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          // color: Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, User.isSwitch);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Ayarlar',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Mod',
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: User.isSwitch,
                            onChanged: (value) {
                              setState(() {
                                User.isSwitch = value;
                                debugPrint(User.isSwitch.toString());
                              });
                            })
                      ],
                    )
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
