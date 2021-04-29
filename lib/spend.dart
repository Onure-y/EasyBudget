import 'package:flutter/material.dart';

class Spend extends StatelessWidget {
  TextEditingController typeInputController = new TextEditingController();
  TextEditingController moneyInputController = new TextEditingController();
  String typeInput;
  int moneyInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Parani Harca',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(30),
                // color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: typeInputController,
                            autofocus: false,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.account_balance_wallet),
                                hintText: 'Alişveriş,harcamalar....',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 2),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: moneyInputController,
                            autofocus: false,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.attach_money_sharp),
                                hintText: 'Harcamak İstediğiniz Miktar',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 2),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    typeInput = typeInputController.text;
                    moneyInput = int.parse(moneyInputController.text);
                    Navigator.pop(context, [typeInput, moneyInput]);
                  },
                  autofocus: false,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(15),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(100, 100, 100, 0.9),
                    ),
                  ),
                  child: Text(
                    'Onayla',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
