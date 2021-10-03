import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/user_details.dart';

import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/home/payment/payment_home.dart';
import 'package:kango/screens/kuryer/kuryer_screen.dart';
import 'package:kango/screens/trafik/trafik_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../bottom_bar.dart';
import '../../home_screen.dart';
import 'menu_drawer_bloc.dart';

class MenuDrawer extends BaseScreen {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends BaseState<MenuDrawer, DeclarationBloc> {


  @override
  Widget body() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            children: [
              UserDetails(),
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
          onTap: () {
            Navigator.pop(context);
            bottomBarKey.currentState?.navigateTo(3);
          },
          child: MenuItem(
            icon: 'asset/profilq.png',
            text: S.of(context).xsiKabinet,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { return KuryerScreen(); })),
          child: MenuItem(
            icon: 'asset/kuryerrr.png',
            text: S.of(context).kuryerSifarii,
          ),
        ),
        MenuItem(
          icon: 'asset/kart.png',
          text: S.of(context).onlaynDamaHaqqDnii,
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { return TrafikScreen(); })),
          child: MenuItem(
            icon: 'asset/trafik.png',
            text: S.of(context).tariflr,
          ),
        ),
        MenuItem(
          icon: 'asset/newss.png',
          text: S.of(context).xbrlr,
        ),
        MenuItem(
          icon: 'asset/fillials.png',
          text: S.of(context).kangoFiliallar,
        ),
        MenuItem(
          icon: 'asset/poct.png',
          text: S.of(context).laq,
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

  @override
  DeclarationBloc provideBloc() => DeclarationBloc();
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String text;

  const MenuItem({Key? key, required this.icon, required this.text})
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
