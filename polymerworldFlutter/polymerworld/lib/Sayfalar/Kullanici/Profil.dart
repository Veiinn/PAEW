import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1f1f),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 600,
                height: 200,
                color: Color(0xFFFAF4E2),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Color(0xFFFAF4E2),
                  borderRadius: BorderRadius.circular(900),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 350,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Container(
                        width: 350,
                        height: 600,
                        color: Color(0xFFFAF4E2),
                      ),
                      Positioned(
                        top: 75,
                        left: 175,
                        child: Column(
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Yüksek Mühendis',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color(0xff1f1f1f),
                                borderRadius: BorderRadius.circular(150),
                              ),
                            ),
                            Container(
                              width: 135,
                              height: 135,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAF4E2),
                                borderRadius: BorderRadius.circular(300),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              height: 35,
                              width: 110,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Yükle butonunun basılma işlemleri
                                },
                                icon: Icon(
                                  Icons.cloud_upload,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  'Yükle',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  backgroundColor: Color(0xFFFAF4E2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'İletişim Bilgileri',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'E-Posta',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Telefon',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Bağlantılar',
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Birinci butonun basılma işlemleri
                                  },
                                  child: Text('Buton 1'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // İkinci butonun basılma işlemleri
                                  },
                                  child: Text('Buton 2'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Üçüncü butonun basılma işlemleri
                                  },
                                  child: Text('Buton 3'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
