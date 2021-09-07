import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/onboarding/onboarding_screen.dart';

class SpleshScreen extends StatefulWidget {
  @override
  _SpleshScreenState createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      Future.delayed(
        const Duration(seconds: 3),
      ),
      sl.get<AuthRepository>().isLogged()
    ]).then((value) {
      if (value.last) {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        }));
      }else{
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (BuildContext context) {
              return OnBoardingScreen();
            }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.appColor,
        child: Image.asset(
          'asset/logo1.png',
          fit: BoxFit.fitWidth,
          width: 200,
        ),
      ),
    );
  }
}
