import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/onboarding/data.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final totalPages = OnboardingItems.loadItem()!.length;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: totalPages,
              itemBuilder: (BuildContext context, int index) {
                final oi = OnboardingItems.loadItem()![index];
                return Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      InfoData(
                        image: oi.image,
                        subTitle: oi.subTitle,
                        title: oi.title,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 150),
                decoration: const BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 200,
                height: 50,
                child: Center(
                    child: Text(
                  S.of(context).getStarted,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  InfoData({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splBag,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SafeArea(
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: const EdgeInsets.only(
                  bottom: 6,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: const EdgeInsets.only(
                  bottom: 6,
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}




