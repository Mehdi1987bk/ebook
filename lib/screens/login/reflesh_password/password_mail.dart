import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/login/login_screen.dart';

class PasswordMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.appColor,
        child: ListView(
          children: [
            Container(
              height: 75,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Svg('asset/forgot.svg',
                            size: Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height * 0.8)),
                        fit: BoxFit.fitWidth),
                    color: AppColors.appColor),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 8,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          S.of(context).daxilEtdiyini,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                          child: Image.asset(
                        'asset/ok.png',
                        width: 90,
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                LoginScreen(),
                          ), (route) => false);
                        },
                        child: Text(
                          S.of(context).rli,
                          style: const TextStyle(color: AppColors.appColor),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 46,
            )
          ],
        ),
      ),
    );
  }
}
