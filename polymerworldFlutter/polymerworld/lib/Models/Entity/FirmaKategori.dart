class FirmaKategori {
  final int kategoriId;
  final String kategoriAd;
  final bool kategoriDurum;

  FirmaKategori({
    required this.kategoriId,
    required this.kategoriAd,
    required this.kategoriDurum,
  });

  factory FirmaKategori.fromJson(Map<String, dynamic> json) {
    try {
      return FirmaKategori(
        kategoriId: json['kategoriId'],
        kategoriAd: json['kategoriAd'],
        kategoriDurum: json['kategoriDurum'] as bool,
      );
    } catch (e) {
      throw Exception('Error parsing FirmaKategori from JSON: $e');
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
