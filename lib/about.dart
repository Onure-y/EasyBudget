import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const githubUrl = 'https://github.com/Onure-y';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double devicesHeight = MediaQuery.of(context).size.height;
    final double devicesWidht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: devicesHeight * 0.01),
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
                    'Hakkimizda',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  height: devicesHeight * 0.30,
                  width: devicesWidht,
                  child: FaIcon(
                    FontAwesomeIcons.piggyBank,
                    size: 100,
                  )
                  // color: Colors.red,
                  ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color.fromRGBO(230, 230, 230, 1),
                  width: devicesWidht,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.github),
                                onPressed: () {},
                              ),
                              FaIcon(FontAwesomeIcons.instagram),
                              FaIcon(FontAwesomeIcons.linkedin),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu \n Mobil Programlama dersi kapsamında 193301004 numaralı Onur Emre YILDIRIM tarafından 30 Nisan 2021 günü yapılmıştır",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
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
