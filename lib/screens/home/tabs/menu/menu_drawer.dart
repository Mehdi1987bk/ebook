import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/common/user_details.dart';

import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/contact_us/contacts_us.dart';
import 'package:kango/screens/home/tabs/home/payment/payment_home.dart';
import 'package:kango/screens/kuryer/kuryer_screen.dart';
import 'package:kango/screens/trafik/trafik_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../bottom_bar.dart';
import '../../home_screen.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            children: [
              const UserDetails(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.appColor,
                      size: 28,
                    )),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 34, bottom: 10, left: 16),
              child: Text(
                S.of(context).digrBlmlr,
                style: TextStyles.styleText10,
              ),
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 8.5, left: 20, right: 20),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 12),
          child: PaymentHome(),
        ),
        GestureDetector(
          onTap: () async {
            if (selectedMenuIndex != 0) {
              selectedMenuIndex = 0;
              Navigator.pop(context);
              await Future.delayed(Duration(milliseconds: 300));

              Navigator.popUntil(context, (route) => route.isFirst);
              bottomBarKey.currentState?.navigateTo(3);
            } else {
              Navigator.pop(context);
            }
          },
          child: MenuItem(
            icon: 'asset/profilq.png',
            text: S.of(context).xsiKabinet,
            index: 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (selectedMenuIndex != 1) {
              selectedMenuIndex = 1;
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                return KuryerScreen();
              }), (route) => route.isFirst);
            } else {
              Navigator.pop(context);
            }
          },
          child: MenuItem(
            icon: 'asset/kuryerrr.png',
            text: S.of(context).kuryerSifarii,
            index: 1,
          ),
        ),
        MenuItem(
          icon: 'asset/kart.png',
          text: S.of(context).onlaynDamaHaqqDnii,
          index: 2,
        ),
        GestureDetector(
          onTap: () {
            if (selectedMenuIndex != 3) {
              selectedMenuIndex = 3;
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                return TrafikScreen();
              }), (route) => route.isFirst);
            } else {
              Navigator.pop(context);
            }
          },
          child: MenuItem(
            icon: 'asset/trafik.png',
            text: S.of(context).tariflr,
            index: 3,
          ),
        ),
        MenuItem(
          icon: 'asset/newss.png',
          text: S.of(context).xbrlr,
          index: 4,
        ),
        MenuItem(
          icon: 'asset/fillials.png',
          text: S.of(context).kangoFiliallar,
          index: 5,
        ),
        GestureDetector(
          onTap: () {
            if (selectedMenuIndex != 6) {
              selectedMenuIndex = 6;
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                return ContactsUs();
              }), (route) => route.isFirst);
            } else {
              Navigator.pop(context);
            }
          },
          child:  MenuItem(
            icon: 'asset/poct.png',
            text: S.of(context).laq,
            index: 6,
          ),
        ),

        Container(
          margin:
              const EdgeInsets.only(bottom: 8.5, left: 20, right: 20, top: 15),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 12, left: 20, right: 10, top: 0),
          child: Text(S.of(context).oluxBtnHquqlarQorunur),
        )
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String text;
  final int index;

  const MenuItem(
      {Key? key, required this.icon, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, top: 8),
      height: 59,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.buttonText.withOpacity(0.08)),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, top: 20, bottom: 19, right: 17),
            child: Image.asset(icon),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Text(
              text,
              style: TextStyles.styleText11,
            ),
          ),
        ],
      ),
    );
  }
}
