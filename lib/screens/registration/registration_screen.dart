import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/registration/page/step_one.dart';
import 'package:kango/screens/registration/page/step_three.dart';
import 'package:kango/screens/registration/page/step_two.dart';
import 'package:kango/screens/registration/registration_bloc.dart';
import 'package:kango/screens/utils/custem_scrol_viev.dart';

class RegistrationScreen extends BaseScreen {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState
    extends BaseState<RegistrationScreen, RegistrationBloc> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _notifier = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _notifier.value = _pageController.page ?? 0;
    });
  }

  @override
  Widget body() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 75),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/bagraund_nbord.jpg'),
                fit: BoxFit.fitWidth),
          ),
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 68,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'asset/group967.png',
                      fit: BoxFit.fitWidth,
                      width: 180,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.of(context).ifrmiUnutmusam,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Text(
                      S.of(context).loginDescribtion,
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ValueListenableBuilder<double>(
                    valueListenable: _notifier,
                    builder: (BuildContext context, value, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16,top: 45),
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: value,
                          decorator: DotsDecorator(
                            color: Colors.grey.withOpacity(0.6),
                            size: const Size.square(14.0),
                            activeSize: const Size(73.0, 14.0),
                            activeColor: AppColors.appColor,
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            SliverFillRemaining(

              child: PageView(
                controller: _pageController,
                physics:  NeverScrollableScrollPhysics(),
                children: [
                  StepOne(
                      bloc: bloc,
                      onNexStep: moveToNextPage,
                      previousPage: moveToPreviousPage),
                  StepTwo(
                      onNexStep: moveToNextPage,
                      previousPage: moveToPreviousPage, bloc: bloc,),
                  StepThree(
                      onNexStep: moveToNextPage,
                      previousPage: moveToPreviousPage, bloc: bloc,),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  WillPopCallback? get onWillPop => () async {
        if ((_pageController.page ?? 0.0) < 1.0) {
          return true;
        } else {
          await _pageController.previousPage(
              duration: const Duration(milliseconds: 350), curve: Curves.ease);

          return false;
        }
      };

  void moveToNextPage() {
    if ((_pageController.page ?? 0) > 1.0) {
      bloc.registration();
      return;
    }
    _pageController.nextPage(
        duration: const Duration(milliseconds: 350), curve: Curves.ease);
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 350), curve: Curves.ease);
  }

  @override
  RegistrationBloc provideBloc() {
    return RegistrationBloc();
  }

  void moveToPreviousPage() {
    if ((_pageController.page ?? 0.0) < 1.0) {
      Navigator.pop(context);
      return;
    }
    _pageController.previousPage(
        duration: const Duration(milliseconds: 350), curve: Curves.ease);
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 350), curve: Curves.ease);
  }
}
