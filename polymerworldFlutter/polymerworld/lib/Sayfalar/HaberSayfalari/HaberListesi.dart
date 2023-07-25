import 'package:flutter/material.dart';
import 'package:polymerworld/Models/API/api.services.dart';
import 'package:polymerworld/Models/Entity/Haber.dart';
import 'HaberGuncelleme.dart';

class HaberListesi extends StatefulWidget {
  @override
  _HaberListesiState createState() => _HaberListesiState();
}

class _HaberListesiState extends State<HaberListesi> {
  List<Haber> haberler = [];

  @override
  void initState() {
    super.initState();
    fetchHaberler();
  }

  Future<void> fetchHaberler() async {
    final newsApi = NewsApi();
    final response = await newsApi.getAllHaberler();
    setState(() {
      haberler = response;
    });
  }

  Future<void> _silHaber(int haberId) async {
    final newsApi = NewsApi();
    bool deleted = await newsApi.deleteHaber(haberId);
    if (deleted) {
      setState(() {
        haberler.removeWhere((haber) => haber.haberId == haberId);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Haber silindi!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Haber silinirken hata oluştu!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: haberler.length,
      itemBuilder: (context, index) {
        Haber haber = haberler[index];
        return ListTile(
          title: Text(haber.haberBaslik),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _silHaber(haber.haberId),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                color: haber.haberDurum
                    ? Colors.green
                    : Colors.red, // Renk değiştirme
                onPressed: () => _haberGuncelle(context, haber),
              ),
            ],
          ),
        );
      },
    );
  }

  void _haberGuncelle(BuildContext context, Haber haber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HaberGuncelleme(haber: haber),
      ),
    );
  }
}
