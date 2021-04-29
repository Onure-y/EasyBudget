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
    final double devicesHeight = MediaQuery.of(context).size.height;
    final double devicesWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: devicesHeight * 0.01),
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
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(bottom: 10),
                      // color: Colors.yellow,
                      child: Row(
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
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hakkimizda',
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_alt_sharp),
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
