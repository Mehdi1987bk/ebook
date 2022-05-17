import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class OnboardingItem {
  final String title;
  final String subTitle;
  final String image;

  OnboardingItem(
      {required this.title,
      required this.subTitle,
      required this.image,
});
}

class OnboardingItems {
  static List<OnboardingItem>? loadItem() {
    final fi = <OnboardingItem>[
      OnboardingItem(
          title: 'Read books online with Bookleaks',
          subTitle:
              'Read the book for learning, to relaxing, and for yourself.',
          image: "asset/images/onbording.png",
      ),

    ];
    return fi;
  }
}
