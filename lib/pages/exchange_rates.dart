import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/main.dart';
import 'package:http/http.dart' as http;

class ExchangeRates extends StatefulWidget {
  const ExchangeRates({Key? key}) : super(key: key);

  @override
  _ExchangeRatesState createState() => _ExchangeRatesState();
}

class _ExchangeRatesState extends State<ExchangeRates> {
  final Uri apiUrl = Uri.parse("https://api.frankfurter.app/latest?from=TRY");

  Future<Map<String, dynamic>> fecthData() async {
    var result = await http.get(apiUrl);
    Map<String, dynamic> data = await json.decode(result.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doviz Kurlari'),
      ),
      body: Container(
          child: FutureBuilder<Map<String, dynamic>>(
              future: fecthData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var turkishLiras = snapshot.data['base'];
                  var myRates = ['USD', 'EUR', 'JPY', 'GBP'];
                  return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: myRates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                snapshot.data['rates'][myRates[index]]
                                    .toString(),
                                style: TextStyle(color: Colors.green),
                              ),
                              trailing: Text('${myRates[index]}/$turkishLiras'),
                            )
                          ],
                        ));
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
