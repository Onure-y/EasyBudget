import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/main.dart';
import 'package:http/http.dart' as http;

class ExchangeRates extends StatelessWidget {
  final Uri apiUrl = Uri.parse("https://api.frankfurter.app/latest?from=TRY");

  Future<List<dynamic>> fecthData() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doviz Kurlari'),
      ),
      body: Container(
          child: FutureBuilder<List<dynamic>>(
              future: fecthData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: Column(
                          children: [ListTile(title: Text(snapshot.data))],
                        ));
                      });
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
