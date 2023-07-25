import 'package:flutter/material.dart';

class FirmaIslemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131), // Ekran arkaplan rengi
      appBar: AppBar(
        backgroundColor: Color(0xFF313131), // Appbar arkaplan rengi
        // title: Image.asset(
        //   'lib/assets/paew.png', // Logo resmi için assets klasörü kullanılıyor
        //   width: 30,
        //   height: 30,
        // ),
        centerTitle: true, // Başlığın ortalanması
        elevation:
            0, // Appbar'ın gölgesini kaldırmak için elevation değerini 0 yapıyoruz
      ),
      body: SingleChildScrollView(
        // Ekranı kaydırmak için SingleChildScrollView ekliyoruz
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalanma
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Yatayda tam genişlik
            children: [
              Text(
                'FİRMA İŞLEMLERİ', // Kullanıcının adı veya başlık
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center, // Metni ortala
              ),
              SizedBox(height: 20), // Boşluk bırakmak için SizedBox ekliyoruz

              // Butonlar ve aralarındaki boşluklar için Column widget'ı ekliyoruz
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                    },
                    child: Column(
                      children: [
                        Icon(Icons.person_add_alt_sharp,
                            size: 30,
                            color: Colors.white), // Yerleşik ikon eklendi
                        Text(
                          'FİRMA EKLE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 243, 117, 33), // ÜYE EKLE butonunun rengi
                      minimumSize:
                          Size(400, 150), // Genişlik ve yükseklik belirtildi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Butonlar arasına boşluk ekliyoruz

                  ElevatedButton(
                    onPressed: () {
                      // İlgili butona basıldığında yapılacak işlemler buraya gelir.
                    },
                    child: Column(
                      children: [
                        Icon(Icons.list,
                            size: 30,
                            color: Colors.white), // Yerleşik ikon eklendi
                        Text(
                          'FİRMA LİSTESİ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 76, 175, 175), // ÜYE LİSTESİ butonunun rengi
                      minimumSize:
                          Size(400, 150), // Genişlik ve yükseklik belirtildi
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
}
