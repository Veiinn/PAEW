import 'dart:convert';
import 'dart:typed_data';

class Haber {
  final int haberId;
  final String haberBaslik;
  final String haberIcerik;
  final Uint8List haberResim;
  final DateTime haberTarih;
  final int yaziciId;
  final int kategoriId;
  final bool haberDurum; // Haber durumu için bool alan eklendi

  Haber({
    required this.haberId,
    required this.haberBaslik,
    required this.haberIcerik,
    required this.haberResim,
    required this.haberTarih,
    required this.yaziciId,
    required this.kategoriId,
    required this.haberDurum, // Haber durumu alanı eklendi
  });

  factory Haber.fromJson(Map<String, dynamic> json) {
    final Uint8List resimBytes = base64Decode(json['haberResim']);
    return Haber(
      haberId: json['haberId'],
      haberBaslik: json['haberBaslik'],
      haberIcerik: json['haberIcerik'],
      haberResim: resimBytes,
      haberTarih: DateTime.parse(json['haberTarih']),
      yaziciId: json['kullaniciId'],
      kategoriId: json['kategoriId'],
      haberDurum: json['haberDurum'], // Haber durumu alanı eklendi
    );
  }

  Map<String, dynamic> toJson() {
    final String resimBase64 = base64Encode(haberResim);
    return {
      'haberId': haberId,
      'haberBaslik': haberBaslik,
      'haberIcerik': haberIcerik,
      'haberResim': resimBase64,
      'haberTarih': haberTarih.toIso8601String(),
      'yaziciId': yaziciId,
      'kategoriId': kategoriId,
      'haberDurum': haberDurum, // Haber durumu alanı eklendi
    };
  }
}
