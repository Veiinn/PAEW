import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polymerworld/Models/API/api.services.dart';
import 'package:polymerworld/Models/Entity/Haber.dart';
import 'package:polymerworld/Models/Entity/HaberKategori.dart';

class HaberGuncelleme extends StatefulWidget {
  final Haber haber;

  HaberGuncelleme({required this.haber});

  @override
  _HaberGuncellemeState createState() => _HaberGuncellemeState();
}

class _HaberGuncellemeState extends State<HaberGuncelleme> {
  final _formKey = GlobalKey<FormState>();
  late String haberBaslik;
  late String haberIcerik;
  late int kategoriId;
  List<HaberKategori> kategoriler = [];
  File? _resim;
  bool haberDurum = false; // Checkbox için haber durumunu tutacak değişken
  final haberApiService = NewsApi();
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    haberBaslik = widget.haber.haberBaslik;
    haberIcerik = widget.haber.haberIcerik;
    kategoriId = widget.haber.kategoriId;
    haberDurum = widget.haber.haberDurum;

    // Kategorileri getirme işlemi için fetchKategoriler metodunu çağırıyoruz.
    fetchKategoriler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Haber Güncelle')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: haberBaslik,
                onSaved: (value) => haberBaslik = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Haber başlığı boş olamaz';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Haber Başlık'),
              ),
              TextFormField(
                initialValue: haberIcerik,
                onSaved: (value) => haberIcerik = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Haber içeriği boş olamaz';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Haber İçerik'),
              ),
              DropdownButtonFormField<int>(
                value: kategoriId,
                onChanged: (value) {
                  setState(() {
                    kategoriId = value!;
                  });
                },
                items: kategoriler.map((kategori) {
                  return DropdownMenuItem<int>(
                    value: kategori.kategoriId,
                    child: Text(kategori.kategoriAd),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Kategori Seç'),
              ),
              CheckboxListTile(
                value: haberDurum,
                onChanged: (value) {
                  setState(() {
                    haberDurum = value!;
                  });
                },
                title: Text('Haber Durumu'),
              ),
              _buildResimSecButton(),
              ElevatedButton(
                onPressed: _haberGuncelle,
                child: Text('Güncelle'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResimSecButton() {
    return ElevatedButton(
      onPressed: _resimSec,
      child: Text('Resim Seç'),
    );
  }

  Future<void> fetchKategoriler() async {
    try {
      final newsApi = NewsApi();
      final fetchedKategoriler = await newsApi.getHaberKategoriler();
      setState(() {
        kategoriler = fetchedKategoriler;
      });
    } catch (e) {
      // Hata durumunda işlemleri yap
      print('Kategoriler alınırken hata oluştu: $e');
    }
  }

  void _resimSec() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _resim = File(pickedFile.path);
      }
    });
  }

  void _haberGuncelle() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final updatedHaber = Haber(
        haberId: widget.haber.haberId,
        haberBaslik: haberBaslik,
        haberIcerik: haberIcerik,
        haberResim: _resim != null
            ? await _resim!.readAsBytes()
            : widget.haber.haberResim,
        haberTarih: widget.haber.haberTarih,
        yaziciId: widget.haber.yaziciId,
        kategoriId: kategoriId,
        haberDurum: haberDurum, // Güncellenen haber durumu değeri
      );

      bool updated = await haberApiService.updateHaber(updatedHaber);
      if (updated) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Haber güncellendi!'),
        ));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Haber güncellenirken hata oluştu!'),
        ));
      }
    }
  }
}
