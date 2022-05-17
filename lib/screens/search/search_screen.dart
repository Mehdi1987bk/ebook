import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/utils.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/book/books_item.dart';
import 'package:kango/screens/book_details/book_detail_screen.dart';
import 'package:kango/screens/search/search_bloc.dart';

class SearchScreen extends BaseScreen {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseState<SearchScreen, SearchBloc> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      bloc.onSearch(textEditingController.text.trim());
    });
    scrollController.addListener(() {
      hideKeyboardOnScroll(context, scrollController);
      if (scrollController.position.extentAfter <=
          MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: Text(S.of(context).axtar),
      backgroundColor: AppColors.appColor,
    );
  }

  @override
  Widget body() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 10),
          child: TextField(
            cursorColor: AppColors.appColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.appColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true
            ),
            controller: textEditingController,
          ),
        ),

        StreamBuilder<List<Book>>(
            stream: bloc.paginableList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.requireData.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.72,
                      ),
                      controller: scrollController,
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
                    ),
                  );
                }
              }
              return SizedBox();
            }),
      ],
    );
  }

  @override
  SearchBloc provideBloc() {
    return SearchBloc();
  }
}
