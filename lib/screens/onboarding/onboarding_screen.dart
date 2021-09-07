import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/onboarding/data.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final ValueNotifier<double> _notifier = ValueNotifier(0);
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _notifier.value = _controller.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = OnboardingItems.loadItem()!.length;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: totalPages,
              itemBuilder: (BuildContext context, int index) {
                final oi = OnboardingItems.loadItem()![index];
                return Container(
                  child: Column(
                    children: [
                      InfoData(
                        image: oi.image,
                        subTitle: oi.subTitle,
                        color: oi.color,
                        title: oi.title,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _notifier,
            builder: (BuildContext context, value, Widget? child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 64,left: 16),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: value,
                  decorator: DotsDecorator(
                    color: Colors.grey.withOpacity(0.6),
                    size: const Size.square(10.0),
                    activeSize: const Size(46.0, 10.0),
                    activeColor: OnboardingItems.loadItem()![
                    _controller.page?.toInt() ?? 0]
                        .color,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: ValueListenableBuilder<double>(
        valueListenable: _notifier,
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            padding: const EdgeInsets.only(right: 20,bottom: 40),
            child: FloatingActionButton(
              onPressed: () {
                if(_controller.page == 2){
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => LoginScreen()));
                }else{
                _controller.nextPage(curve: Curves.ease, duration: const Duration(milliseconds: 350));}
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color:
                      OnboardingItems.loadItem()![_controller.page?.toInt() ?? 0]
                          .color,
                ),
              ),
              backgroundColor:
                  OnboardingItems.loadItem()![_controller.page?.toInt() ?? 0]
                      .color,
            ),
          );
        },
      ),
    );
  }
}

class InfoData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Color color;

  InfoData(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splBag,
      child: Column(
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.49,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'asset/group967.png',
                fit: BoxFit.fitWidth,width: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 6,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 6,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
