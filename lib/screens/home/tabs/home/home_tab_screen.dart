import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/user_details_home.dart';
import 'package:kango/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:kango/screens/home/tabs/home/payment/payment_home.dart';
import 'package:kango/screens/home/tabs/home/services/services.dart';

class HomeTab extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<HomeTab, HomeTabBloc> {

  @override
  Widget body() {
    return ListView(
      children: [
        UserDetails(user: bloc.user,),
        BlocServices(),
        Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.06, top: 24),
          child: PaymentHome(),
        )
      ],
    );
  }

  @override
  HomeTabBloc provideBloc() {
    return HomeTabBloc();
  }
}
