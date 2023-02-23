import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.brown[300],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();
  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIcon)
            : secimler.add(kYanlisIcon);
        test_1.sonrakiSoru();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('BRAVO TESTİ BİTİRDİNİZ'),
            //content: new Text('data'),
            actions: [
              new ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    secimler = [];
                    test_1.testiSifirla();
                  });
                },
                child: new Text('BAŞA DÖN'),
              )
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIcon)
            : secimler.add(kYanlisIcon);
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          '***BİLGİ TESTİ***',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 35,
              color: Colors.brown[900],
              fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(12),
                            ),
                          ),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyanAccent),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(12),
                            ),
                          ),
                          child: Icon(
                            Icons.thumb_up,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
