import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/bottom_bar.dart';
import 'package:kango/screens/kuryer/kuryer_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

class BlocServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 24),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).xidmtlrimi,
                style: TextStyles.styleText10,
              )),
        ),
        SizedBox(
          height: 138,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8.5),
            scrollDirection: Axis.horizontal,
            children: [
              Services(
                text: S.of(context).balamalar,
                color: AppColors.homeButtonBacgraund,
                image: 'asset/botton3.svg',
                image2: 'asset/service1.png',
                onTab:(){
                  bottomBarKey.currentState?.navigateTo(2);
                },
              ),
              Services(
                text: S.of(context).sifarilr,
                color: AppColors.homeButtonBacgraund2,
                image: 'asset/botton2.svg',
                image2: 'asset/service1.png',
                onTab: (){},
              ),
              Services(
                text: S.of(context).kuryerSifariEt,
                color: AppColors.onbording3,
                image: 'asset/velo.svg',
                image2: 'asset/service1.png',
                onTab: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                    return KuryerScreen();
                  }));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Services extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  final String image2;
  final VoidCallback onTab;

  const Services(
      {Key? key,
      required this.color,
      required this.text,
      required this.image,
      required this.image2,
      required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        width: 100,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, left: 13),
                  height: 42,
                  child: SvgPicture.asset(
                    image,
                    color: Colors.white,
                    width: 40,
                    height: 41,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Container(
              height: 67,
              width: 85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: ExactAssetImage(image2), fit: BoxFit.fitWidth)),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyles.styleText9,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
