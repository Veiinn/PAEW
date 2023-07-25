import 'package:flutter/material.dart';

Widget PaylasimHaber(
    String resim, String kategori, String baslik, String yazici, String tarih) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Image.network(resim),
        solmetin(kategori, 20, Colors.green),
        metin(baslik, 20, Colors.black),
        Row(
          children: [
            metin(yazici, 15, Colors.grey),
            bosluk(0, 5),
            metin(tarih, 15, Colors.grey)
          ],
        )
      ]),
    ),
  );
}

TextFormField input(String placeholder) {
  return TextFormField(
    onChanged: (value) {},
    obscureText: true,
    decoration: InputDecoration(
      hintText: placeholder,
      filled: true,
      fillColor: Color(0xFF535353),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: EdgeInsets.fromLTRB(12.0, 25, 12.0, 16.0),
    ),
  );
}

Widget YuvarlakButton(String metin, double size, Color renk) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: islem,
          child: Text(
            metin,
            style: TextStyle(
              color: renk,
              fontSize: size,
            ),
          ),
        ),
      ),
    ),
  );
}

Align YaziButton(String metin, double size, Color renk) {
  return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
          onPressed: islem,
          child: Text(
            metin,
            style: TextStyle(fontSize: size, color: renk),
          )));
}

TextButton ShareButton(
  String metin,
  Color renk,
) {
  return TextButton(
      onPressed: islem,
      child: Row(
        children: [
          Icon(
            Icons.share,
            color: renk,
          ),
          Text(
            metin,
            style: TextStyle(color: renk),
          )
        ],
      ));
}

void islem() {
  print("Giriş Yapılacak");
}

Image resim() {
  return Image.asset(
      'assets/resim1.png'); // Replace with the actual path to your asset image
}

//metinler başlangıç
Text metin(String metin, double size, Color renk) {
  return Text(
    metin,
    style: TextStyle(color: renk, fontSize: size),
  );
}

Text metin1(String metin, double size, Color renk) {
  return Text(
    metin,
    style: TextStyle(fontSize: size, color: renk),
  );
}

Widget solmetin(String metin, double size, Color selection) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Text(
        metin,
        style: TextStyle(color: selection, fontSize: size),
      ),
    ),
  );
}

SizedBox bosluk(double? YukleksikSize, double? GenislikSize) {
  return SizedBox(
    height: YukleksikSize,
    width: GenislikSize,
  );
}

Container cizgi(double kalinlik, double uzunluk, Color renk) {
  return Container(
    height: kalinlik, // Çizginin yüksekliği
    width: uzunluk, // Çizginin genişliği ekran genişliği kadar
    color: renk,
  ); // Çizgi rengi
}
