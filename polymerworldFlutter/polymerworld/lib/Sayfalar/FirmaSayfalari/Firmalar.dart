// import 'package:flutter/material.dart';
// import 'package:polymerworld/Models/Haber.dart';
// import 'package:polymerworld/Models/api.services.dart';
// import '../Models/FirmaKategori.dart';
// import 'Haber.dart';

// class Firmalar extends StatefulWidget {
//   Firmalar({Key? key}) : super(key: key);

//   @override
//   _FirmalarPageState createState() => _FirmalarPageState();
// }

// class _FirmalarPageState extends State<Firmalar> {
//   final int itemsPerPage = 3;
//   List<Firmalar> haberler = [];
//   List<FirmaKategori> kategoriler = [];
//   int currentPage = 1;
//   TextEditingController pageController = TextEditingController();
//   ScrollController _scrollController = ScrollController();
//   bool _showPageButtons = false;
//   int? selectedKategoriId;

//   @override
//   void initState() {
//     super.initState();
//     fetchHaberler();
//     fetchKategoriler();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     super.dispose();
//   }

//   Future<void> fetchHaberler() async {
//     final newsApi = NewsApi();
//     final response = await newsApi.getHaberler();
//     setState(() {
//       haberler = response;
//       selectedKategoriId = null; // "Tümü" butonu seçili olacak
//     });
//   }

//   Future<void> fetchKategoriler() async {
//     final newsApi = NewsApi();
//     final response = await newsApi.getKategoriler();
//     setState(() {
//       kategoriler = response;
//     });

//     // Kategorileri aldıktan sonra haberleri varsayılan olarak tümü olarak getir
//     if (kategoriler.isNotEmpty) {
//       fetchHaberlerByKategori(
//           kategoriId: kategoriler[0]
//               .kategoriId); // Varsayılan olarak ilk kategori getiriliyor
//     }
//   }

//   Future<void> fetchHaberlerByKategori({required int kategoriId}) async {
//     final newsApi = NewsApi();
//     final response = await newsApi.getHaberler(kategoriId: kategoriId);
//     setState(() {
//       haberler = response;
//       selectedKategoriId = kategoriId;
//     });
//   }

//   List<Haber> getCurrentPageItems() {
//     final startIndex = (currentPage - 1) * itemsPerPage;
//     final endIndex = startIndex + itemsPerPage;
//     if (endIndex > haberler.length) {
//       return haberler.sublist(startIndex);
//     } else {
//       return haberler.sublist(startIndex, endIndex);
//     }
//   }

//   int getTotalPageCount() {
//     return (haberler.length / itemsPerPage).ceil();
//   }

//   void goToPage(int page) {
//     setState(() {
//       if (page >= 1 && page <= getTotalPageCount()) {
//         currentPage = page;
//       }
//     });
//   }

//   void nextPage() {
//     goToPage(currentPage + 1);
//   }

//   void previousPage() {
//     goToPage(currentPage - 1);
//   }

//   void goToEnteredPage() {
//     final int? enteredPage = int.tryParse(pageController.text);
//     if (enteredPage != null &&
//         enteredPage >= 1 &&
//         enteredPage <= getTotalPageCount()) {
//       goToPage(enteredPage);
//     }
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       setState(() {
//         _showPageButtons = true;
//       });
//     } else {
//       setState(() {
//         _showPageButtons = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentPageItems = getCurrentPageItems();

//     return Scaffold(
//       backgroundColor: const Color(0xFFFAF4E2),
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           children: [
//             // Kategorileri butonlar şeklinde üstte göster
//             Container(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: kategoriler.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     // "Tümü" butonu
//                     final isActive = selectedKategoriId == null;
//                     return GestureDetector(
//                       onTap: () {
//                         fetchHaberler();
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 8),
//                         decoration: BoxDecoration(
//                           border: isActive
//                               ? Border(
//                                   bottom: BorderSide(
//                                     color: Colors.green,
//                                     width: 2,
//                                   ),
//                                 )
//                               : null,
//                         ),
//                         child: ElevatedButton(
//                           onPressed: null,
//                           style: ElevatedButton.styleFrom(
//                             primary: isActive ? Colors.green : null,
//                             elevation: 0,
//                           ),
//                           child: Text(
//                             'Tümü',
//                             style: TextStyle(
//                               color: isActive ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   } else {
//                     // Kategori butonları
//                     final kategori = kategoriler[index - 1];
//                     final isActive = kategori.kategoriId == selectedKategoriId;
//                     return GestureDetector(
//                       onTap: () {
//                         fetchHaberlerByKategori(
//                             kategoriId: kategori.kategoriId);
//                         print(kategori.kategoriId.toString());
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 8),
//                         decoration: BoxDecoration(
//                           border: isActive
//                               ? Border(
//                                   bottom: BorderSide(
//                                     color: Colors.green,
//                                     width: 2,
//                                   ),
//                                 )
//                               : null,
//                         ),
//                         child: ElevatedButton(
//                           onPressed: null,
//                           style: ElevatedButton.styleFrom(
//                             primary: isActive ? Colors.green : null,
//                             elevation: 0,
//                           ),
//                           child: Text(
//                             kategori.kategoriAd,
//                             style: TextStyle(
//                               color: isActive ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),

//             // Seçili kategoriye göre veya "Tümü" butonuna göre haberleri göster
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: currentPageItems.length,
//               itemBuilder: (context, index) {
//                 final haber = currentPageItems[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HaberPage(haber: haber),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.memory(haber.haberResim),
//                               SizedBox(height: 10),
//                               Text(
//                                 haber.haberBaslik,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 haber.haberIcerik,
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               SizedBox(height: 5),
//                               Text(haber.haberTarih.toString()),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _showPageButtons
//           ? BottomAppBar(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: previousPage,
//                   ),
//                   Text('Sayfa $currentPage / ${getTotalPageCount()}'),
//                   IconButton(
//                     icon: Icon(Icons.arrow_forward),
//                     onPressed: nextPage,
//                   ),
//                   SizedBox(width: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text('Sayfaya Git'),
//                           content: TextField(
//                             controller: pageController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               labelText: 'Sayfa Numarası Girin',
//                             ),
//                           ),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 goToEnteredPage();
//                                 Navigator.pop(context);
//                               },
//                               child: Text('Git'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     child: Text('Sayfaya Git'),
//                   ),
//                 ],
//               ),
//             )
//           : null,
//     );
//   }
// }
