import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/common/user_details_home.dart';
import 'package:kango/screens/home/tabs/setting/setting_bloc.dart';
import 'package:kango/screens/home/tabs/setting/setting_Item.dart';

class SettingScreen extends BaseScreen {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseState<SettingScreen,SettingBloc> {
  @override
  Widget body() {
    return ListView(
      children: [
        UserDetailsDeclaration(user: bloc.user,),
        SettingItem(),
      ],
    );
  }

  @override
  SettingBloc provideBloc() {
return SettingBloc();
  }

}
