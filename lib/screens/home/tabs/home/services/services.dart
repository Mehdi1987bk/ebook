import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/screens/book/books_item.dart';
import 'package:kango/screens/book_details/book_detail_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

class BlocServices extends StatelessWidget {
  final List<Book> books;
  final Category? category;

  const BlocServices({Key? key, required this.books,  this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              final book = books[index];
            return  BooksItem(
                image:book.bookCover?.path ?? '',
                title: book.title,
                onTab: () {
                  Navigator.push(context,
                    CupertinoPageRoute(builder: (BuildContext context) {
                      return BookDetailScreen(
                        book: book,
                        category: category,
                      );
                    }), );
                },
                autho: book.author?.name ?? '',
                price: book.price,
              );
            },
          ),
        )
      ],
    );
  }
}
