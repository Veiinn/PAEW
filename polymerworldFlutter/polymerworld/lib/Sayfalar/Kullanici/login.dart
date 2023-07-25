import 'package:flutter/material.dart';
import 'package:polymerworld/Servisler/methodlar.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(49, 49, 49, 0.322),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                bosluk(80, 0),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    child: Row(
                      children: [
                        resim(),
                        bosluk(0, 15),
                        metin("POLYMER WORLD", 23,
                            Color.fromRGBO(55, 173, 106, 100))
                      ],
                    )),
                cizgi(1, 250, Colors.white),
                bosluk(20, 0),
                metin("YETKİLİ GİRİŞ", 30, Colors.white),
                bosluk(40, 0),
                solmetin("E-Posta", 20, Colors.white),
                input("E-Posta"),
                const SizedBox(
                    height:
                        16), // İki input arasında boşluk için SizedBox ekledik
                solmetin("Şifre", 20, Colors.white),
                input("Şifre"),
                bosluk(30, 0),
                YuvarlakButton("Giriş Yap", 20, Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
