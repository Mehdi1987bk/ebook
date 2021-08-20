import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/screens/login/reqistration/reqistration_bloc.dart';

class RgistrationBloc extends BaseScreen {
  @override
  _RgistrationBlocState createState() => _RgistrationBlocState();
}

class _RgistrationBlocState extends BaseState<RgistrationBloc,RegistrationBloc> {
  @override
  Widget body() {
    return Container();
  }

  @override
  RegistrationBloc provideBloc() {
   return RegistrationBloc();
  }

}
