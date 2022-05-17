import 'dart:io';
import 'dart:ui';

import 'package:kango/data/network/request/create_book_request.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/network/response/category.dart';
import '../../domain/repositories/book_repository.dart';

class AddBookBloc extends BaseBloc {
  final PublishSubject<File> bookFile = PublishSubject();
  final PublishSubject<File> bookImage = PublishSubject();
  final BookRepository _bookRepository = sl.get<BookRepository>();
  final PublishSubject<Category> selectedCategory = PublishSubject();



  late final Stream<List<Category>> categoryList =
  ValueConnectableStream(runStream(_bookRepository.getAllCategories).map((event) {
    final categorys = <Category>[];
    for (final element in event) {
      categorys.add(element..subCategory = false);

      if (element.items.isNotEmpty) {
        element.items.forEach(categorys.add);
      }
    }
    return categorys;
  } ))
      .autoConnect();


  List<Category> categories = [];
  Locale? locale;
  File? image;
  File? file;


  void onImageSelected(File file) {
    image = file;
    bookImage.add(file);
  }

  void onBookFileSelected(File file) {
    this.file = file;
    bookFile.add(file);
  }

  Future<void> uploadBook(CreateBookRequest request) {
    return run(_bookRepository.createBook(request));
  }
}
