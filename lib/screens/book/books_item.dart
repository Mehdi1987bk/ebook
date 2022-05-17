import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class BooksItem extends StatelessWidget {
  final String image;
  final String title;
  final String autho;
  final int price;
  final VoidCallback onTab;

  const BooksItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.autho,
      required this.price,
      required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          width: 150,
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
                  image,
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
                    Text(title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,maxLines: 2,),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(S.of(context).mllif + autho,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,maxLines: 1,),
                    if (price == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          S.of(context).pulsuz,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    if (price != 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          '$price ${S.of(context).azn}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
