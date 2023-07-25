import 'dart:convert';
import 'dart:typed_data';

class Firma {
  final int firmaId;
  final String firmaIsim;
  final String firmaOzet;
  final String firmaEposta;
  final String firmaTelefon;
  final Uint8List firmaResim;
  final String firmaPuan;
  final int firmaKategori;

  Firma({
    required this.firmaId,
    required this.firmaIsim,
    required this.firmaOzet,
    required this.firmaEposta,
    required this.firmaTelefon,
    required this.firmaResim,
    required this.firmaPuan,
    required this.firmaKategori,
  });

  factory Firma.fromJson(Map<String, dynamic> json) {
    final Uint8List resimBytes = base64Decode(json['firmaResim']);
    return Firma(
      firmaId: json['firmaId'],
      firmaIsim: json['firmaIsim'],
      firmaOzet: json['firmaOzet'],
      firmaEposta: json['firmaEposta'],
      firmaTelefon: json['firmaTelefon'],
      firmaResim: resimBytes,
      firmaPuan: json['firmaPuan'],
      firmaKategori: json['firmaKategori'],
    );
  }

  Map<String, dynamic> toJson() {
    final String resimBase64 = base64Encode(firmaResim);
    return {
      'firmaId': firmaId,
      'firmaIsim': firmaIsim,
      'firmaOzet': firmaOzet,
      'firmaEposta': firmaEposta,
      'firmaTelefon': firmaTelefon,
      'firmaResim': resimBase64,
      'firmaPuan': firmaPuan,
      'firmaKategori': firmaKategori,
    };
  }
}
