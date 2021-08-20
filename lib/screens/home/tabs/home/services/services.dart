import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            height: 138,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: ExactAssetImage('asset/bagraund_nbord.png'),
                  fit: BoxFit.cover,
                )
                ,color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}
