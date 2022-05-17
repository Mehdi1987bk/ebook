import 'dart:convert';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/screens/book/books_item.dart';
import 'package:kango/screens/book_details/book_detail_screen.dart';
import 'package:kango/screens/home/tabs/saved_books/saved_book_ithem.dart';
import 'package:kango/screens/home/tabs/saved_books/saved_books_bloc.dart';

class SavedBooksScreen extends BaseScreen {
  @override
  _SavedBooksScreenState createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState
    extends BaseState<SavedBooksScreen, SavedBooksBloc> {
  @override
  Widget body() {
    return StreamBuilder<List<BookEntity>>(
      stream: bloc.books,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.requireData.isNotEmpty) {
            return GridView.builder(
              itemCount: snapshot.requireData.length,
              itemBuilder: (BuildContext context, int index) {
                final book = snapshot.requireData[index];
                return SavedBooksItem(
                  onDelete: ()=> bloc.deleteBook(book),
                  bookEntity: book,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 8,
                childAspectRatio: 0.68,
              ),
            );
          } else {
            return Center(
              child: Text('Kitab yoxdur',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            );
          }
        }
        return SizedBox();
      },
    );
  }

  @override
  SavedBooksBloc provideBloc() {
    return SavedBooksBloc();
  }
}
