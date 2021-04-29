import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Send extends StatelessWidget {
  TextEditingController inputController = new TextEditingController();
  int sendValue;

  Color color1 = Color.fromRGBO(220, 220, 220, 0);
  Color color2 = Color.fromRGBO(220, 220, 220, 1);
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
                    'Para Gönder',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Şu Kişiye gönder',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: Colors.purple,
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/avatar-1.png'),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Eray',
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.credit_card),
                                      Text(
                                        '****1780',
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      // color: Colors.purple,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              image: AssetImage('assets/images/avatar-2.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              height: 60,
                              width: 60,
                            ),
                          ),
                          Column(
                            children: [
                              Text('İrem'),
                              Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  Text('****1078'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                // color: Colors.blueAccent,
                child: Column(
                  children: [
                    TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        hintText: '\$ 0',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        sendValue = int.parse(inputController.text);
                        Navigator.pop(context, -sendValue);
                      },
                      child: Text('Gonder'),
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
