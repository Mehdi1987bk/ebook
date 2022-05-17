import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/utils.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/book/books_item.dart';
import 'package:kango/screens/book_details/book_detail_screen.dart';
import 'package:kango/screens/book_page_category/book_page_category_bloc.dart';

class BookPageCategoryScreen extends BaseScreen {
  final List<Book> initialData;
  final BookType bookType;

  BookPageCategoryScreen({required this.bookType, required this.initialData});

  @override
  _BookPageCategoryScreenState createState() => _BookPageCategoryScreenState();
}

class _BookPageCategoryScreenState
    extends BaseState<BookPageCategoryScreen, BookPageCategoryBloc> {

  @override
  void initState() {
    super.initState();
    bloc.load();

  }


  @override
  PreferredSizeWidget? appBar() {
    return AppBar(backgroundColor: AppColors.appColor,);
  }

  @override
  Widget body() {
    return StreamBuilder<List<Book>>(
      initialData: widget.initialData,
      stream: bloc.paginableList,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.requireData.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 8,
                childAspectRatio: 0.72,
              ),
              itemCount: snapshot.requireData.length,
              itemBuilder: (BuildContext context, int index) {
                final book = snapshot.requireData[index];
                return BooksItem(
                  image: book.bookCover?.path ?? '',
                  title: book.title,
                  onTab: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                        return BookDetailScreen(
                          book: book,
                        );
                      }),
                    );
                  },
                  autho: book.author?.name ?? '',
                  price: book.price,
                );
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }

  @override
  BookPageCategoryBloc provideBloc() {
    return BookPageCategoryBloc(widget.bookType);
  }
}
