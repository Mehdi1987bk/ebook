import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/tariff_baku.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/text_style.dart';

class PrisesPlan extends StatelessWidget {
  final List<Price> price;

  const PrisesPlan({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tarifs = <Widget>[];
    for (var i = 0; i < price.length; i++) {
      tarifs.add(Traf(
        text: price[i].max != null ? '${price[i].min} - ${price[i].max}': '${price[i].min}',
        textPrice: price[i].newPrices,
        textCount: price[i].oldPrices,
      ));
      if (i + 1 < price.length) {
        tarifs.add(const SizedBox(
          height: 30,
        ));
      }
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 17),
          decoration: BoxDecoration(
            color: AppColors.man,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: tarifs,
          ),
        ),
      ],
    );
  }
}

class Traf extends StatefulWidget {
  final String text;
  final String textPrice;
  final String textCount;

  const Traf(
      {Key? key,
      required this.text,
      required this.textPrice,
      required this.textCount})
      : super(key: key);

  @override
  _TrafState createState() => _TrafState();
}

class _TrafState extends State<Traf> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style: TextStyles.styleText22,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              widget.textPrice,
              style: TextStyles.styleText21,
            ),

            const SizedBox(
              width: 4,
            ),
            Container(
              decoration: CustomDecorations().baseBackgroundDecoration(),
              child: Row(
                children: [
                  Text(widget.textCount),
                ],
              ) /* add child content here */,
            ),
          ],
        ),

      ],
    );
  }
}

class CustomDecorations {
  BoxDecoration baseBackgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("asset/sale_cv.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
