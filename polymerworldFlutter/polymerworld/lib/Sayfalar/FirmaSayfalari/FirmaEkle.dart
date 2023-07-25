// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:typed_data';
// import '../Models/FirmaKategori.dart';
// import '../Models/Haber.dart';
// import '../Models/HaberKategori.dart';
// import '../Models/api.services.dart';
// import 'package:image/image.dart' as img;

// class HaberEkle extends StatefulWidget {
//   @override
//   _HaberEkleState createState() => _HaberEkleState();
// }

// class _HaberEkleState extends State<HaberEkle> {
//   final TextEditingController baslikController = TextEditingController();
//   final TextEditingController icerikController = TextEditingController();
//   File? selectedImage;
//   Uint8List? imageBytes;
//   int? selectedKategoriId;
//   List<FirmaKategori> kategoriler = [];
//   int? imageWidth;
//   int? imageHeight;

//   Future<void> fetchKategoriler() async {
//     try {
//       final newsApi = NewsApi();
//       final fetchedKategoriler = await newsApi.getHaberKategoriler();
//       setState(() {
//         kategoriler = fetchedKategoriler;
//       });
//     } catch (e) {
//       // Hata durumunda işlemleri yap
//       print('Kategoriler alınırken hata oluştu: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchKategoriler();
//   }

//   Future<void> addHaber(Haber haber) async {
//     try {
//       final newsApi = NewsApi();
//       await newsApi.addHaber(haber);
//       // İsteğe göre cevabı işle
//     } catch (e) {
//       // Hata durumunda işlemleri yap
//       print('Haber eklenirken hata oluştu: $e');
//     }
//   }

//   Future<bool> checkImageSize(Uint8List imageBytes) async {
//     img.Image? image = img.decodeImage(imageBytes);
//     return image?.width == 450 && image?.height == 450;
//   }

//   Future<void> _selectImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       final imageFile = File(pickedImage.path);
//       final bytes = await imageFile.readAsBytes();

//       final isCorrectSize = await checkImageSize(bytes);

//       if (isCorrectSize) {
//         final image = img.decodeImage(bytes);
//         if (image != null) {
//           setState(() {
//             selectedImage = imageFile;
//             imageBytes = bytes;
//             imageWidth = image.width;
//             imageHeight = image.height;
//           });
//         }
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Hatalı Resim Boyutu'),
//               content: Text('Lütfen 450x450 piksel boyutunda bir resim seçin.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Tamam'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }

//   bool areInputsValid() {
//     return baslikController.text.isNotEmpty &&
//         icerikController.text.isNotEmpty &&
//         imageBytes != null &&
//         selectedKategoriId != null;
//   }

//   void showErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Eksik Bilgi'),
//           content: Text('Lütfen tüm alanları doldurun ve bir resim seçin.'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Tamam'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 450,
//                 height: 450,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: selectedImage != null && imageBytes != null
//                       ? Image.file(selectedImage!, height: 450, width: 450)
//                       : Text(
//                           imageWidth != null && imageHeight != null
//                               ? '$imageWidth x $imageHeight'
//                               : 'Resim boyutu',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   controller: baslikController,
//                   style: TextStyle(fontSize: 18),
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     border: InputBorder.none,
//                     labelText: 'Başlık',
//                     labelStyle: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   controller: icerikController,
//                   style: TextStyle(fontSize: 18),
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     border: InputBorder.none,
//                     labelText: 'İçerik',
//                     labelStyle: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonFormField<int?>(
//                   value: selectedKategoriId,
//                   decoration: InputDecoration(
//                     labelText: 'Kategori',
//                   ),
//                   items: kategoriler.map((kategori) {
//                     return DropdownMenuItem<int?>(
//                       value: kategori.kategoriId,
//                       child: Text(kategori.kategoriAd),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedKategoriId = value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (areInputsValid()) {
//                     final haber = Haber(
//                       haberId: 0,
//                       haberBaslik: baslikController.text,
//                       haberIcerik: icerikController.text,
//                       haberResim: imageBytes!,
//                       haberTarih: DateTime.now(),
//                       yaziciId: 0,
//                       kategoriId: selectedKategoriId!,
//                     );
//                     addHaber(haber);
//                   } else {
//                     showErrorDialog(context);
//                   }
//                 },
//                 child: Text('Haber Ekle'),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _selectImage,
//                 child: Text('Resim Seç'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
