import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/setting/setting_bloc.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

class SettingScreen extends BaseScreen {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseState<SettingScreen, SettingBloc> {
  @override
  Widget body() {
    return ListView(
      children: [
        UserDetailsDeclaration(
          user: bloc.user,
        ),
        Container(
          margin:
              const EdgeInsets.only(bottom: 25, left: 16, right: 16, top: 31),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).xsiKabinet,
              style: TextStyles.styleText4,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 46, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/melumat.png'),
              ),
              Text(
                S.of(context).xsiMlumatlarm,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 61, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/vill.png'),
              ),
              Text(
                S.of(context).xariciNvanlarm,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 61, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/keya.png'),
              ),
              Text(
                S.of(context).ifrniDyi,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => bloc.logout().then((value) =>
              Navigator.pushAndRemoveUntil(context,
                  CupertinoPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }), (route) => false)),
          child: Container(
            padding: const EdgeInsets.only(top: 61, left: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset('asset/loqaut.png'),
                ),
                Text(
                  S.of(context).xEt,
                  style: TextStyles.styleText12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  SettingBloc provideBloc() {
    return SettingBloc();
  }
}
