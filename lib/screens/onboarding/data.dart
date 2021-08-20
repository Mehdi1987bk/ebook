import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class OnboardingItem {
  final String title;
  final String subTitle;
  final String image;
  final Color color;

  OnboardingItem(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.color});
}

class OnboardingItems {
  static List<OnboardingItem>? loadItem() {
    final fi = <OnboardingItem>[
      OnboardingItem(
          title: 'Always stay informed about new features and service',
          subTitle:
              'Receive notifications about new bank products and services, as well as any special offers tailored just for you.',
          image: "asset/sd.png",
          color: AppColors.homeButtonBacgraund),
      OnboardingItem(
          title: 'Always stay informed about new features and service',
          subTitle:
              'Receive notifications about new bank products and services, as well as any special offers tailored just for you.',
          image: "asset/group3.png",
          color: AppColors.onbording2),
      OnboardingItem(
          title: 'Always stay informed about new features and service',
          subTitle:
              'Receive notifications about new bank products and services, as well as any special offers tailored just for you.',
          image: "asset/group2.png",
          color: AppColors.onbording1),
    ];
    return fi;
  }
}
