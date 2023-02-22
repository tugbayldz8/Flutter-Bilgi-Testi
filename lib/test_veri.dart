import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int _kacinciSoru = 0;

  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir.',
        soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır.',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür.', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür.', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır.',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir.',
        soruYaniti: true)
  ];

  String getSoruMetni() {
    return _soruBankasi[_kacinciSoru].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_kacinciSoru].soruYaniti;
  }

  void sonrakiSoru() {
    if (_kacinciSoru < _soruBankasi.length - 1) {
      _kacinciSoru++;
    }
  }

  bool testBittiMi() {
    if (_kacinciSoru >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _kacinciSoru = 0;
  }
}
