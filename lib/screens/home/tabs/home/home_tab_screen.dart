import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/trafic_widget.dart';
import 'package:kango/presentation/common/user_details.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:kango/screens/home/tabs/home/payment/payment_home.dart';
import 'package:kango/screens/home/tabs/home/services/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../../home_screen.dart';

class HomeTab extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<HomeTab, HomeTabBloc> {
  final styleText = const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  final styleText1 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final styleText2 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.appColor);


  @override
  Widget body() {
    return ListView(
      children: [
        const UserDetails(),
        FutureBuilder<User>(
          future: bloc.user,
          builder: (_,snapshot) {
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.only(top: 23, left: 16, right: 41),
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(
                                style: DefaultTextStyle
                                    .of(context)
                                    .style,
                                children: [
                                  TextSpan(text: S
                                      .of(context)
                                      .salam, style: styleText),
                                  TextSpan(
                                      text: " " + snapshot.requireData.firstName +" ",
                                      style: styleText2),
                                  TextSpan(
                                      text: S
                                          .of(context)
                                          .buGnSizXoAlverilrArzuEdirik,
                                      style: styleText),
                                ])),
                      ],
                    ),
                  ],
                ),
              );
            } return SizedBox();

          },),
        Container(
          margin: const EdgeInsets.only(top: 31,bottom: 33,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        BlocServices(),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.06,
              top: 24),
          child: PaymentHome(),
        ),
        const SizedBox(
          height: 40,
        ),
        TraficWidget(),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }

  @override
  HomeTabBloc provideBloc() {
    return HomeTabBloc();
  }
}
