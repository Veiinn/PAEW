import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:polymerworld/Sayfalar/HaberSayfalari/HaberEkle.dart';
import 'package:polymerworld/Sayfalar/HaberSayfalari/HaberListesi.dart';
import 'package:polymerworld/Sayfalar/HaberSayfalari/Haberler.dart';
import 'package:polymerworld/Sayfalar/Kullanici/Profil.dart';
import 'package:polymerworld/Sayfalar/Kullanici/Yetkili/AdminPanel.dart';
import 'package:polymerworld/Sayfalar/Kullanici/login.dart';
import 'package:polymerworld/Servisler/methodlar.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _selectedIndex = 0;
  final List<Widget> _pageOptions = [
    Haberler(),
    HaberListesi(),
    Profil(),
    HaberEkle(),
    AdminPanel()
  ];

  @override
  Widget build(BuildContext context) {
    Color appBarColor =
        _selectedIndex == 1 ? Colors.black : const Color(0xFFFAF4E2);
    Color drawerColor =
        _selectedIndex == 1 ? Colors.white : const Color(0xFF313131);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF4E2),
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: drawerColor),
        title: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                resim(),
                metin(
                  "PAEW",
                  20,
                  _selectedIndex == 1 ? Colors.white : Color(0xFF313131),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF313131),
        child: Container(
          height: double.infinity, // Set a finite height for the container
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          bosluk(75, 5),
                          resim(),
                          bosluk(0, 10),
                          metin("PAEW", 20, Colors.black),
                          bosluk(25, 0),
                        ],
                      ),
                    ],
                  )),
              Center(
                child: Container(
                  height: 1,
                  width: 275,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Widget'ları dikey yönde üstte ve altta hizalar
                    children: [
                      solmetin("SEÇENEKLER", 20, Colors.green),
                      ListTile(
                        title: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Haberler',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Haber Listesi',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Profil',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Haber Ekle',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Admin Sayfası',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal:
                                  16), // Düğme içeriğinin iç kenar boşluğu
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16), // Düğme kenarlarının yuvarlatılması için bir değer
                          ),
                          backgroundColor:
                              Colors.amber, // Düğmenin arka plan rengi
                        ),
                        icon: Icon(
                          Icons.login, // Giriş yapma ikonu
                          size: 20,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Giriş Yap',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white), // Yazı boyutu ve rengi
                        ),
                      )
                    ],
                  ),
                ),
              ), // Yükseklik bırakmak için Spacer ekleyin
            ],
          ),
        ),
      ),
      body: _pageOptions[_selectedIndex],
    );
  }
}
