import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_budget/data/user_data.dart';
import 'package:easy_budget/pages/exchange_rates.dart';
import 'package:easy_budget/pages/movement_list.dart';
import 'package:easy_budget/pages/overview.dart';
import 'package:easy_budget/pages/profile.dart';
import 'package:easy_budget/pages/register.dart';
import 'package:easy_budget/pages/send.dart';
import 'package:easy_budget/pages/spend.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/pages/login.dart';
import 'package:easy_budget/pages/settings.dart';
import 'package:easy_budget/pages/about.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(primaryColor: Colors.grey.shade400),
      title: 'Budget App',
      initialRoute: '/login',
      routes: {
        '/': (context) => MainPage(),
        '/send': (context) => Send(),
        '/spend': (context) => Spend(),
        '/about': (context) => About(),
        '/movements': (context) => MovList(),
        '/profile': (context) => Profile(),
        '/exchanges': (context) => ExchangeRates(),
        '/settings': (context) => AppSettings(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/overview': (context) => Overview(),
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
// İşlemleri tutan Container taslağı

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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Container(
                      height: 50,
                      child: Image(
                          image: AssetImage('assets/images/avatar.png'),
                          alignment: Alignment.center,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/settings');
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
                      child: totalBalance(),
                    ),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, maxHeight: 200),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                // color: Colors.purple,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Send()));
                        },
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade200,
                          minimumSize: Size(60, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Spend()));
                      },
                      child: Icon(Icons.arrow_upward_rounded),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade200,
                        minimumSize: Size(60, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/movements');
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
            Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, maxHeight: 400),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    streamBuilderWidget(),
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
