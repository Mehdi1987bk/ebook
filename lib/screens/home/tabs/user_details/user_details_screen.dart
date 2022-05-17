import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/data/network/response/user_details_response.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/user_details/user_details_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/entities/book.dart';
import '../../../../domain/entities/pagination.dart';
import '../../../../presentation/bloc/utils.dart';
import '../../../book/books_item.dart';
import '../../../book_details/book_detail_screen.dart';

class UserDetailsScreen extends BaseScreen {
  final Future<List<Book>?> authorBooks;

  UserDetailsScreen({required this.authorBooks});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState
    extends BaseState<UserDetailsScreen, UserDetailsBloc> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget body() {
    return Container(
      child: FutureBuilder<UserDetailsResponse>(
        future: bloc.userDetails,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              controller: scrollController,

              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                      height: 120,
                      padding: EdgeInsets.only(left: 16, right: 16,top: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10))),
                                  )),
                            ],
                          ),
                          ClipOval(
                            child: snapshot.requireData.avatar == null
                                ? Image.network(
                                    "asset/mask.png",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    snapshot.requireData.avatar,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            snapshot.requireData.fullName,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 15,
                          ),
                          child: Text(
                            snapshot.requireData.about ?? 'bbvbvvb',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              const Spacer(),
                              if (snapshot.requireData.facebook != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/fb.png',
                                    width: 33,
                                  ),
                                  onTap: () async {
                                    launch(snapshot.requireData.facebook);
                                  },
                                ),
                              if (snapshot.requireData.facebook != null)
                                const Spacer(),
                              if (snapshot.requireData.instagram != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/insta.png',
                                    width: 33,
                                  ),
                                  onTap: () async {
                                    launch(snapshot.requireData.instagram);
                                  },
                                ),
                              if (snapshot.requireData.instagram != null)
                                const Spacer(),
                              if (snapshot.requireData.twitter != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/tv.png',
                                    width: 33,
                                  ),
                                  onTap: () async {
                                    launch(snapshot.requireData.twitter);
                                  },
                                ),
                              if (snapshot.requireData.twitter != null)
                                const Spacer(),
                              if (snapshot.requireData.youtube != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/yt.png',
                                    width: 33,
                                  ),
                                  // Image.asset('asset/images/in.png',width: 33,),
                                  onTap: () async {
                                    launch(snapshot.requireData.youtube);
                                  },
                                ),
                              if (snapshot.requireData.youtube != null)
                                const Spacer(),
                              if (snapshot.requireData.google != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/gg.png',
                                    width: 33,
                                  ),
                                  onTap: () async {
                                    launch(snapshot.requireData.google);
                                  },
                                ),
                              if (snapshot.requireData.google != null)
                                const Spacer(),
                              if (snapshot.requireData.linkedin != null)
                                GestureDetector(
                                  child: Image.asset(
                                    'asset/images/in.png',
                                    width: 33,
                                  ),
                                  onTap: () async {
                                    launch(snapshot.requireData.linkedin);
                                  },
                                ),
                              if (snapshot.requireData.linkedin != null)
                                const Spacer(),
                              const Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
               FutureBuilder<List<Book>>(
                  future: bloc.books,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.requireData.isNotEmpty) {
                        return SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.72,
                          ), delegate: SliverChildBuilderDelegate((_,index){
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

                        },childCount: snapshot.requireData.length),

                        );
                      }
                    }
                    return const SliverToBoxAdapter();
                  },
                ),
                SliverToBoxAdapter(child: SizedBox(height: 60,),)
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  UserDetailsBloc provideBloc() {
    return UserDetailsBloc();
  }
}
