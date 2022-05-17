import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/data/network/response/user_details_response.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/book_page_category/book_page_category_screen.dart';
import 'package:kango/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:kango/screens/home/tabs/home/services/services.dart';
import 'package:kango/screens/search/search_screen.dart';
import 'package:kango/screens/sub_category/sub_category_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../../../data/cache/cache_manager.dart';
import '../../../../main.dart';
import '../../../../presentation/common/pop_up_selector.dart';
import 'category/category_new_page.dart';
import 'category/category_screen.dart';

class HomeTab extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<HomeTab, HomeTabBloc>
    with RouteAware, ErrorDispatcher {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  Widget body() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(
          bottom: 56,
        ),
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: FutureBuilder<UserDetailsResponse>(
              future: bloc.userDetails,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: snapshot.requireData.avatar == null
                            ? Image.network(
                                'asset/mask.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                snapshot.requireData.avatar,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(16),
                        height: 55,
                        decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '${snapshot.requireData.firstName} ${S.of(context).salam}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
                            return SearchScreen();
                          }));
                        },
                        child: const Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: FutureBuilder<Locale>(
                            future: bloc.currentLocale,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return DropDownSelector<Locale>(
                                    initialValue: snapshot.data,
                                    height: 35,
                                    iconRightPadding: 2,
                                    style: TextStyle(fontSize: 13, color: Colors.black87),
                                    items: getItems(),
                                    onChanged: bloc.changeCurrentLocale);
                              }
                              return const SizedBox();
                            }),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          StreamBuilder<List<Category>>(
            stream: bloc.categoryList,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            S.of(context).kateqoriyalar,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (BuildContext context) {
                              return CategoryNewPage(
                                category: snapshot.requireData,
                              );
                            }));
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              S.of(context).hamsnGr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: snapshot.requireData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final category = snapshot.requireData[index];
                          return CategoryItem(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                  builder: (BuildContext context) {
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
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<Pagination<Book>>(
            stream: bloc.relevanceBook,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData && snapshot.requireData.data.isNotEmpty) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        CategoryName(
                          name: S.of(context).aktual,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return BookPageCategoryScreen(
                                    initialData: snapshot.requireData.data,
                                    bookType: BookType.relevance,
                                  );
                                }));
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.appColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  S.of(context).hamsnGr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    BlocServices(
                      books: snapshot.requireData.data,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          StreamBuilder<Pagination<Book>>(
            stream: bloc.topRated,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData && snapshot.requireData.data.isNotEmpty) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        CategoryName(
                          name: S.of(context).nMhur,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return BookPageCategoryScreen(
                                    initialData: snapshot.requireData.data,
                                    bookType: BookType.topRated,
                                  );
                                }));
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.appColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  S.of(context).hamsnGr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    BlocServices(
                      books: snapshot.requireData.data,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          StreamBuilder<Pagination<Book>>(
            stream: bloc.latest,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData && snapshot.requireData.data.isNotEmpty) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        CategoryName(
                          name: S.of(context).yeni,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return BookPageCategoryScreen(
                                    initialData: snapshot.requireData.data,
                                    bookType: BookType.latest,
                                  );
                                }));
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.appColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  S.of(context).hamsnGr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    BlocServices(
                      books: snapshot.requireData.data,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }


  List<DropDownItem<Locale>> getItems() => [
    DropDownItem(
      value: Locale("ru"),
      text: S.of(context).ru,
    ),
    DropDownItem(
      value: Locale("az"),
      text: S.of(context).az,
    ),
    DropDownItem(
      value: Locale("en"),
      text: S.of(context).en,
    ),
  ];


  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  HomeTabBloc provideBloc() {
    return HomeTabBloc();
  }
}

class CategoryName extends StatelessWidget {
  final String name;

  const CategoryName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          )),
    );
  }
}
