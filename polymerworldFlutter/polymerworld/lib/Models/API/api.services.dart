import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:polymerworld/Models/Entity/Firma.dart';
import 'package:polymerworld/Models/Entity/FirmaKategori.dart';
import 'package:polymerworld/Models/Entity/Haber.dart';
import 'package:polymerworld/Models/Entity/HaberKategori.dart';

class NewsApi {
  static const String apiUrl = 'https://192.168.10.135:7272';

  Future<List<Haber>> getHaberler({int? kategoriId}) async {
    String url = "$apiUrl/HaberlerApi";
    if (kategoriId == null) {
      url += "/ButunHaberler";
    }
    if (kategoriId != null) {
      url += "/KategoriHaberler?kategoriId=$kategoriId";
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final haberler =
          responseData.map((item) => Haber.fromJson(item)).toList();
      return haberler;
    } else {
      throw Exception('Haberleri getirirken bir hata oluştu.');
    }
  }

  Future<List<Haber>> getAllHaberler({int? kategoriId}) async {
    String url = "$apiUrl/HaberlerApi/ButunHaberlerListesi";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final haberler =
          responseData.map((item) => Haber.fromJson(item)).toList();
      return haberler;
    } else {
      throw Exception('Haberleri getirirken bir hata oluştu.');
    }
  }

  Future<void> addHaber(Haber haber) async {
    final response = await http.post(
      Uri.parse('$apiUrl/HaberlerApi/HaberEkle'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(haber.toJson()),
    );

    if (response.statusCode == 200) {
      // Haber başarıyla eklendiğinde yapılacak işlemler
    } else {
      throw Exception('Haber eklerken bir hata oluştu.');
    }
  }

  Future<bool> deleteHaber(int haberId) async {
    try {
      final response = await http.delete(
        Uri.parse("$apiUrl/HaberlerApi/HaberSil?haberId=$haberId"),
        headers: {'Content-Type': 'application/json'},
      );

      // API'den dönen cevabı kontrol et
      if (response.statusCode == 200) {
        // Başarılı silme
        return true;
      } else {
        // Silme başarısız
        return false;
      }
    } catch (e) {
      // Hata yönetimi, hata durumunu loglama veya kullanıcıya bildirme
      print("Hata: $e");
      return false;
    }
  }

  Future<bool> updateHaber(Haber haber) async {
    try {
      final response = await http.put(
        Uri.parse("$apiUrl/HaberlerApi/HaberGuncelle"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(haber.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Hata yönetimi, hata durumunu loglama veya kullanıcıya bildirme
      print("Hata: $e");
      return false;
    }
  }

  Future<List<HaberKategori>> getHaberKategoriler() async {
    try {
      final response = await http
          .get(Uri.parse("$apiUrl/KategoriHaberApi/ButunHaberKategoriler"));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        final kategoriler =
            responseData.map((item) => HaberKategori.fromJson(item)).toList();
        return kategoriler;
      } else {
        throw Exception(
            'Kategorileri getirirken bir hata oluştu. StatusCode: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching kategoriler: $e');
      rethrow; // Rethrow the exception to propagate it
    }
  }

  Future<void> addFirma(Firma firma) async {
    final response = await http.post(
      Uri.parse('$apiUrl/HaberlerApi/HaberEkle'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(firma.toJson()),
    );

    if (response.statusCode == 200) {
      // Haber başarıyla eklendiğinde yapılacak işlemler
    } else {
      throw Exception('Haber eklerken bir hata oluştu.');
    }
  }

  Future<List<FirmaKategori>> getFirmaKategoriler() async {
    try {
      final response =
          await http.get(Uri.parse("$apiUrl/KategoriApi/ButunKategoriler"));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        final kategoriler =
            responseData.map((item) => FirmaKategori.fromJson(item)).toList();
        return kategoriler;
      } else {
        throw Exception(
            'Kategorileri getirirken bir hata oluştu. StatusCode: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching kategoriler: $e');
      rethrow; // Rethrow the exception to propagate it
    }
  }
}
