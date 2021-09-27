import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/trafic_widget.dart';
import 'package:kango/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:kango/screens/home/tabs/home/payment/payment_home.dart';
import 'package:kango/screens/home/tabs/home/services/services.dart';

import '../../home_screen.dart';

class HomeTab extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<HomeTab, HomeTabBloc> {

  @override
  Widget body() {
    return ListView(
      children: [
        userInfo,
        BlocServices(),
        Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.06, top: 24),
          child: PaymentHome(),
        ),
        const SizedBox(height: 40,),
        TraficWidget(),
        const SizedBox(height: 48,),

      ],
    );
  }

  @override
  HomeTabBloc provideBloc() {
    return HomeTabBloc();
  }
}
