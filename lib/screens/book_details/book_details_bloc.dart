import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kango/data/network/request/add_bookId_request.dart';
import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/request/send_comment.dart';
import 'package:kango/domain/bd/book_dao.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/entities/review.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../../main.dart';

class BookDetailsBloc extends PaginableBloc<Review> {
  final BookRepository bookRepository = sl.get<BookRepository>();
  final Book book;
  final dio = sl.get<Dio>();
  final bookDao = sl.get<BookDao>();

  BookDetailsBloc(this.book);

  final PublishSubject<BookDetails> bookDetails = PublishSubject();

  Future<void> getBookDetails() =>
      run(bookRepository.getBooksDetails(book.slug, 1)).then(bookDetails.add);

  Future<String> downloadFile(BookDetails bookDetails) async {
    if (await Permission.storage.isGranted) {
      await Permission.storage.request();
      return run(_startDownload(bookDetails));
    } else {
      return run(_startDownload(bookDetails));
    }
  }

  Future<String> _startDownload(BookDetails bookDetails) async {
    final appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final path =
        '${appDocDir!.path}/${bookDetails.availableFiles.first.filename}.${bookDetails.availableFiles.first.extension}';
    final file = File(path);
//    await file.delete();

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        bookDetails.availableFiles.first.url,
        path,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          print((receivedBytes / totalBytes * 100).toStringAsFixed(0));
          //Check if download is complete and close the alert dialog
          if (receivedBytes == totalBytes) {}
        },
      );
      _addToDownlodList(bookDetails);
    }
    final bookEntity = BookEntity(
      id: bookDetails.ebook.id,
      slug: bookDetails.ebook.slug,
      price: bookDetails.ebook.price,
      publicationYear: bookDetails.ebook.publicationYear ?? "",
      isFeatured: bookDetails.ebook.isFeatured,
      isPrivate: bookDetails.ebook.isPrivate,
      isActive: bookDetails.ebook.isActive,
      publisher: bookDetails.ebook.publisher ?? "",
      authorName: bookDetails.ebook.author?.name ?? '',
      title: bookDetails.ebook.title,
      description: bookDetails.ebook.description,
      rating: bookDetails.ebook.rating,
      imagePath: bookDetails.ebook.bookCover?.path ?? '',
      bookPath: path,
      authorId: bookDetails.ebook.authorId,
      authorSlug: bookDetails.ebook.slug,
    );
    await bookDao.insertBook(bookEntity);
    return path;
  }

  Future<String> getPaymentLink(BookDetails book) {
    return run(bookRepository.getPaymentUrl(book.ebook.id.toString()));
  }

  void _addToDownlodList(BookDetails bookDetails) {
    bookRepository
        .addBookRead(AddBookIdRequest(bookDetails.ebook.id))
        .onError((error, stackTrace) => logger.e(error));
  }

  @override
  Future<Pagination<Review>> provideSource(int page) async {
    final _book = await bookRepository.getBooksDetails(book.slug, page);
    bookDetails.add(_book);
    return _book.reviews;
  }

  Future<void> sendComment(String text, int rating) {
    return run(bookRepository.sendComment(
        SendCommentRequest(rating: rating, reviewerName: "vfvf", comment: text),
        book.id));
  }
}
