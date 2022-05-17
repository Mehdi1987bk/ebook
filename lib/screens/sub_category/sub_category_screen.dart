import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/utils.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/book/books_item.dart';
import 'package:kango/screens/book_details/book_detail_screen.dart';
import 'package:kango/screens/home/tabs/home/category/category_screen.dart';
import 'package:kango/screens/sub_category/sub_category_bloc.dart';

import '../../main.dart';

class SubCategoryScreen extends BaseScreen {
  final Category category;

  SubCategoryScreen({required this.category});

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState
    extends BaseState<SubCategoryScreen, SubCategoryBloc> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.load();
    scrollController.addListener(() {
      hideKeyboardOnScroll(context, scrollController);
      if (scrollController.position.extentAfter <=
          MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  Widget body() {
    return SafeArea(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.white,
            expandedHeight: widget.category.items.isNotEmpty ? 100 : 0,
            title: Text(widget.category.name),
            centerTitle: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ListView.builder(
                itemCount: widget.category.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final category = widget.category.items[index];
                  return CategoryItem(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return SubCategoryScreen(
                          category: category,
                        );
                      }));
                    },
                    category: category,
                  );
                },
              ),
            ),
          ),
          StreamBuilder<List<Book>>(
            stream: bloc.paginableList,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.requireData.isEmpty) {
                  return const SliverFillRemaining(
                      child: Center(
                          child: Text(
                    'data',
                  )));
                } else {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final book = snapshot.requireData[index];
                        _editDeclaration() {
                          sl
                              .get<BookRepository>()
                              .getBooksDetails(snapshot.requireData[index].slug,1)
                              .then((value) => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (BuildContext context) {
                                      return BookDetailScreen(
                                        book: book,
                                        category: widget.category,
                                      );
                                    }),
                                  ));
                        }

                        return BooksItem(
                          image:
                              snapshot.requireData[index].bookFile?.path ?? '',
                          title: snapshot.requireData[index].title,
                          autho: snapshot.requireData[index].author?.name ?? '',
                          price: snapshot.requireData[index].price,
                          onTab: _editDeclaration,
                        );
                      },
                      childCount: snapshot.requireData.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.72,
                    ),
                  );
                }
              }
              return const SliverToBoxAdapter();
            },
          )
        ],
      ),
    );
  }

  @override
  SubCategoryBloc provideBloc() {
    return SubCategoryBloc(widget.category);
  }
}
