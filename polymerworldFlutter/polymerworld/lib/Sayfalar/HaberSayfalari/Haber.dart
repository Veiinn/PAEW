import 'package:flutter/material.dart';
import 'package:polymerworld/Models/Entity/Haber.dart';
import 'package:polymerworld/Servisler/methodlar.dart';

class HaberPage extends StatelessWidget {
  final Haber haber;

  HaberPage({required this.haber});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFAF4E2),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("<"),
                ),
                Image.memory(haber.haberResim),
                metin(haber.haberBaslik, 20, Colors.black),
                metin(haber.haberTarih.toString(), 20, Colors.black),
                metin(haber.haberIcerik, 20, Colors.black),
                cizgi(1, 375, Colors.black),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye),
                    metin("14K Görüntülenme", 15, Colors.black),
                    bosluk(0, 150),
                    ShareButton("Paylaş", Colors.green)
                  ],
                ),
                cizgi(1, 200, Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
