import 'dart:convert';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class SavedBooksItem extends StatelessWidget {
  final BookEntity bookEntity;
  final VoidCallback onDelete;
  const SavedBooksItem({Key? key, required this.bookEntity, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openBook(bookEntity.bookPath);
      },
      child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  bookEntity.imagePath,
                  height: 160,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          bookEntity.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      S.of(context).mllif + bookEntity.authorName,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    if (bookEntity.price == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          S.of(context).pulsuz,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    if (bookEntity.price != 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          '${bookEntity.price} ${S.of(context).azn}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration:
                                  BoxDecoration(color: AppColors.appColor),
                              child: Text(S.of(context).silin))),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void _openBook(String path) {
    EpubViewer.setConfig(
        themeColor: AppColors.appColor,
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
}
