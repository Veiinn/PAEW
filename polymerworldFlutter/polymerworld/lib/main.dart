import 'package:flutter/material.dart';
import "Sayfalar/NavigatorPage.dart";
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Diğer sayfayı açmak için örnek olarak SecondPage'yi kullanalım
    return MaterialApp(
      title: 'Flutter Uygulaması',
      home: NavigatorPage(),
    );
  }
}
