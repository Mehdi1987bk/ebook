import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/setting/reading_book/reading_book_screen.dart';
import 'package:kango/screens/home/tabs/setting/setting_bloc.dart';
import 'package:kango/screens/home/tabs/setting/update_password/password_edit_widget.dart';
import 'package:kango/screens/home/tabs/setting/update_password/update_password_screen.dart';
import 'package:kango/screens/home/tabs/setting/user_details_edit/user_details_edit_screen.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../../../domain/entities/book.dart';
import '../../../../main.dart';
import '../../../add_book/add_book_screen.dart';
import '../../home_screen.dart';
import 'add_user_cart/add_user_cart_screen.dart';
import 'cart/cart_info_screen.dart';
import 'my_book_downlide/MyBookDownlideScreen.dart';

class SettingScreen extends BaseScreen {
  final Future<List<Book>?> authorBooks;

  SettingScreen(this.authorBooks);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseState<SettingScreen, SettingBloc>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget body() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).settings,
              style: TextStyles.styleText4,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (BuildContext context) {
              return TrafikScreen();
            }));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16, top: 15),
            height: 50,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'asset/keya.svg',
                    height: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  S.of(context).paroluDyi,
                  style: TextStyles.styleText12,
                ),
              ],
            ),
          ),
        ),

        FutureBuilder<List<Book>?>(
            future: widget.authorBooks,
            builder: (context, snapshot) {
              //Todo Author Book Add
              if (snapshot.hasData ) {
                return  InkWell(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (BuildContext context) {
                      return CartInfoScreen();
                    }),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
                    height: 50,
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                            },
                            icon: Icon(Icons.credit_card_rounded,color: Colors.white,)
                        ),
                        Text(
                          S.of(context).kartMlumatlar,
                          style: TextStyles.styleText12,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            }),

























        InkWell(
          onTap: () => bloc.logout().then((value) =>
              Navigator.pushAndRemoveUntil(context,
                  CupertinoPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }), (route) => false)),
          child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
            height: 50,
            padding: const EdgeInsets.only(top: 0, left: 10),
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     CupertinoPageRoute(builder: (BuildContext context) {
                    //   return UserDetailsEditScreen();
                    // }));
                  },
                  icon: SvgPicture.asset(
                    'asset/loqaut.svg',
                    height: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  S.of(context).xmaq,
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
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }



  @override
  SettingBloc provideBloc() {
    return SettingBloc();
  }
}
