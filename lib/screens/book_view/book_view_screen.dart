// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:kango/presentation/bloc/base_screen.dart';
// import 'package:kango/screens/book_view/book_view_bloc.dart';
//
// class BookViewScreen extends BaseScreen {
//   final String bookPath;
//
//   BookViewScreen(this.bookPath);
//
//   @override
//   _BookViewScreenState createState() => _BookViewScreenState();
// }
//
// class _BookViewScreenState extends BaseState<BookViewScreen, BookViewBloc> {
//   late final EpubController _epubReaderController;
//
//   @override
//   PreferredSizeWidget? appBar() {
//     return AppBar(
//       title: EpubActualChapter(
//         controller: _epubReaderController,
//         builder: (chapterValue) => Text(
//           (chapterValue?.chapter?.Title?.trim() ?? '').replaceAll('\n', ''),
//           textAlign: TextAlign.start,
//         ),
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.save_alt),
//           color: Colors.white,
//           onPressed: () => _showCurrentEpubCfi(context),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget? drawer() {
//     return Drawer(
//       child: EpubReaderTableOfContents(controller: _epubReaderController),
//     );
//   }
//
//   @override
//   void initState() {
//     final loadedBook =
//         _loadFromAssets();
//     _epubReaderController = EpubController(
//       document: EpubReader.readBook(loadedBook),
//       //  document: EpubReader,
//       // epubCfi:
//       //     'epubcfi(/6/26[id4]!/4/2/2[id4]/22)', // book.epub Chapter 3 paragraph 10
//       // epubCfi:
//       //     'epubcfi(/6/6[chapter-2]!/4/2/1612)', // book_2.epub Chapter 16 paragraph 3
//     );
//     super.initState();
//   }
//
//   @override
//   Widget body() {
//     return EpubView(
//       controller: _epubReaderController,
//         textStyle:TextStyle(color: Colors.red,fontSize: 12),
//
//         onDocumentLoaded: (document) {
//         print('isLoaded: $document');
//       },
//       dividerBuilder: (_) => Divider(),
//     );
//   }
//
//   void _showCurrentEpubCfi(context) {
//     final cfi = _epubReaderController.generateEpubCfi();
//
//     if (cfi != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(cfi),
//           action: SnackBarAction(
//             label: 'GO',
//             onPressed: () {
//               _epubReaderController.gotoEpubCfi(cfi);
//             },
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _epubReaderController.dispose();
//     super.dispose();
//   }
//
//   Future<Uint8List> _loadFromAssets() async {
//     final file =File(widget.bookPath);
//     // final bytes = await rootBundle.load(assetName);
//     return file.readAsBytes();
//   }
//
//   @override
//   BookViewBloc provideBloc() {
//     return BookViewBloc();
//   }
// }
