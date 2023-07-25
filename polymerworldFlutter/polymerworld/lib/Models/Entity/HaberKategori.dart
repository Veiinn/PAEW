class HaberKategori {
  final int kategoriId;
  final String kategoriAd;
  final bool kategoriDurum;

  HaberKategori({
    required this.kategoriId,
    required this.kategoriAd,
    required this.kategoriDurum,
  });

  factory HaberKategori.fromJson(Map<String, dynamic> json) {
    try {
      return HaberKategori(
        kategoriId: json['kategoriId'],
        kategoriAd: json['kategoriAd'],
        kategoriDurum: json['kategoriDurum'] as bool,
      );
    } catch (e) {
      throw Exception('Error parsing Kategori from JSON: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'kategoriId': kategoriId,
      'kategoriAd': kategoriAd,
      'kategoriDurum': kategoriDurum,
    };
  }
}
