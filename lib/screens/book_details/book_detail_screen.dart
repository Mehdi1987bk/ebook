import 'dart:convert';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/review.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/book_details/book_details_bloc.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:kango/screens/home/tabs/home/services/services.dart';
import 'package:kango/screens/payment/payment_screen.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/bloc/utils.dart';
import 'comment/send_comment.dart';

class BookDetailScreen extends BaseScreen {
  final Book book;
  final Category? category;

  BookDetailScreen({this.category, required this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState
    extends BaseState<BookDetailScreen, BookDetailsBloc> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.load();
    scrollController.addListener(() {
      if (scrollController.position.extentAfter <=
          MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  Widget body() {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              Container(
                height: 50,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_outlined)),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                StreamBuilder<BookDetails>(
                  stream: bloc.bookDetails,
                  builder: (BuildContext context, snapshot) {
                    final formatter = DateFormat('dd-MM-yyyy');

                    if (snapshot.hasData) {
                      var text =
                          '<p><strong>${snapshot.requireData.ebook.description}</strong></p>';
                      return Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                if (widget.book.bookFile?.path != null)
                                  Image.network(
                                    widget.book.bookFile!.path,
                                    width: 160,
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Text(
                                            widget.book.title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      InfoBook(
                                        text: S.of(context).paylad,
                                        name: widget.book.author?.name ?? '',
                                      ),
                                      InfoBook(
                                        text: S.of(context).paylald,
                                        name: formatter.format(snapshot
                                            .requireData
                                            .availableFiles
                                            .first
                                            .file
                                            .createdAt),
                                      ),
                                      if (widget.category != null)
                                        InfoBook(
                                          text: S.of(context).blm,
                                          name: widget.category!.name,
                                        ),
                                      InfoBook(
                                        text: S.of(context).mllif,
                                        name: widget.book.author?.name ?? '',
                                      ),
                                      if (widget.book.isbn != null)
                                        InfoBook(
                                          text: S.of(context).isbn,
                                          name: widget.book.isbn,
                                        ),
                                      if (widget.book.publisher != null)
                                        InfoBook(
                                          text: S.of(context).niriyyat,
                                          name: widget.book.publisher,
                                        ),
                                      if (widget.book.publicationYear != null)
                                        InfoBook(
                                          text: S.of(context).li,
                                          name: widget.book.publicationYear,
                                        ),
                                      if (snapshot.requireData.ebook.price ==
                                              0 ||
                                          snapshot.requireData.ebook.ordered ==
                                              true)
                                        GestureDetector(
                                          onTap: () => _showBookReader(
                                              snapshot.requireData),
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 12),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 200,
                                            height: 40,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  S.of(context).oxu,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                      if (snapshot.requireData.ebook.ordered ==
                                              false &&
                                          snapshot.requireData.ebook.price != 0)
                                        GestureDetector(
                                          onTap: () => _getPaymentLink(
                                              snapshot.requireData),
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 12),
                                            decoration: BoxDecoration(
                                                color: AppColors.appColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 200,
                                            height: 40,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Indi al - ${snapshot.requireData.ebook.price} AZN',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Html(
                                  data: text,
                                  onLinkTap: (
                                    url,
                                    _,
                                    __,
                                    ___,
                                  ) {
                                    _openUrl(url);
                                  },
                                ))
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10, top: 0),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).laqliEkitablar,
                  style: TextStyles.styleText10,
                )),
          ),
        ),
        StreamBuilder<BookDetails>(
          stream: bloc.bookDetails,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return SliverToBoxAdapter(
                child: BlocServices(
                  books: snapshot.requireData.relatedEbooks,
                  category: widget.category,
                ),
              );
            }
            return const SliverToBoxAdapter();
          },
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SendComment(),
              SizedBox(height: 30,),

            ],
          ),
        ),
        StreamBuilder<List<Review>>(
          stream: bloc.paginableList,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.requireData.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      //Todo Comments
                      return Container(
                        height: 100.0,
                        margin: EdgeInsets.only(left: 16,right: 16,bottom: 10),
                        padding: EdgeInsets.only(left: 5,right: 5,bottom: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.appColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: (snapshot.requireData[index].rating)
                                  .toDouble(),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                            ),
                            Expanded(child: Text(snapshot.requireData[index].comment,textAlign: TextAlign.start,)),
                          ],
                        ),
                      );
                    },
                    childCount: snapshot.requireData.length,
                  ),
                );
              }
            }
            return const SliverToBoxAdapter();
          },
        ),
      ],
    );
  }

  @override
  BookDetailsBloc provideBloc() {
    return BookDetailsBloc(widget.book);
  }

  void _showBookReader(BookDetails bookDetails) {
    if (bookDetails.ebook.localPath != null) {
      _openBook(bookDetails.ebook.localPath!);
    }
    bloc.downloadFile(bookDetails).then(_openBook);
  }

  void _openBook(String path) {
    EpubViewer.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true);
    EpubViewer.open(
      path,
      // lastLocation: EpubLocator.fromJson({
      //   "bookId": "2239",
      //   "href": "/OEBPS/ch06.xhtml",
      //   "created": 1539934158390,
      //   "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
      // }),
    );
    EpubViewer.locatorStream.listen((locator) {
      print('LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
    });
    // Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {return BookViewScreen(value); }));
  }

  void _openUrl(String? url) async {
    if (url == null) {
      return;
    }
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _getPaymentLink(BookDetails book) async {
    final url = await bloc.getPaymentLink(book);
    final result = await Navigator.push(context,
        CupertinoPageRoute(builder: (BuildContext context) {
      return PaymentTlScreen(
        url: url,
      );
    }));
    if (result) {
      await bloc.getBookDetails();
    }
  }
}

class InfoBook extends StatelessWidget {
  final String name;
  final String text;

  const InfoBook({Key? key, required this.name, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(text + ': ' + name),
    );
  }
}
