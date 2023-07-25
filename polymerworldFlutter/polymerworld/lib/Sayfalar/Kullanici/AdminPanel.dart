import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131), // Ekran arkaplan rengi
      body: SingleChildScrollView(
        // Scrollable alan ekleniyor
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalanma
            crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortalanma
            children: [
              Text(
                'YÖNETİCİ PANELİ', // Sayfa başlığı
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, // Metni ortala
              ),
              SizedBox(height: 10), // Boşluk bırakmak için SizedBox ekliyoruz
              Text(
                'Müh. Hüseyin Torun', // Kullanıcının adı veya başlık
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center, // Metni ortala
              ),
              SizedBox(height: 20), // Boşluk bırakmak için SizedBox ekliyoruz
              // Diğer widget'ları eklemeye devam edebilirsiniz

              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.person_add_alt_sharp,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'ÜYE EKLE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 18, 107, 190),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.category_sharp,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'KATEGORİ EKLE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFF12BE61),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.newspaper,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'HABER EKLE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFFE859FF),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.list,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'KATEGORİ LİSTESİ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFFE9A540),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.newspaper_sharp,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'HABER LİSTESİ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFFFF003D),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.supervised_user_circle,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'KATEGORİ LİSTESİ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFF80CCE3),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.business_center,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'FİRMA EKLE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFF026100),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                      },
                      child: Column(
                        children: [
                          Icon(Icons.business,
                              size: 30,
                              color: Colors.white), // Yerleşik ikon eklendi
                          Text(
                            'FİRMA LİSTESİ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFF3A20DC),
                        minimumSize: Size(70, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
}
