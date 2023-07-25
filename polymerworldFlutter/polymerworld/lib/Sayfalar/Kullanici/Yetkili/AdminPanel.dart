import 'package:flutter/material.dart';
import 'package:polymerworld/Sayfalar/Kullanici/Yetkili/FirmaIslemleri.dart';
import 'package:polymerworld/Sayfalar/Kullanici/Yetkili/HaberIslemleri.dart';
import 'package:polymerworld/Sayfalar/Kullanici/Yetkili/UyeIslemleri.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  final List<Widget> _pageOptions = [
    UyeIslemleri(),
    FirmaIslemleri(),
    HaberIslemleri(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'YÖNETİCİ PANELİ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Müh. Hüseyin Torun',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _navigateToPage(0);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.person_add_alt_sharp,
                            size: 30, color: Colors.white),
                        Text(
                          'ÜYE İŞLEMLERİ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 18, 107, 190),
                      minimumSize: Size(300, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToPage(1);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.category_sharp,
                            size: 30, color: Colors.white),
                        Text(
                          'FİRMA İŞLEMLERİ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF12BE61),
                      minimumSize: Size(300, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToPage(2);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.newspaper, size: 30, color: Colors.white),
                        Text(
                          'HABER İŞLEMLERİ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      minimumSize: Size(300, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    // To prevent navigating to the same page, check if the selected index is already active.
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    // You can use Navigator to navigate to the selected page. Since the _pageOptions list contains the actual pages,
    // you can directly use it to get the desired page.
    // Make sure you have UyeIslemleri, FirmaIslemleri, and HaberIslemleri defined as separate StatefulWidget classes.

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pageOptions[index]),
    );
  }
}
