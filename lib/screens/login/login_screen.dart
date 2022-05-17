import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/login/reflesh_password/reflash_password_screen.dart';
import 'package:kango/screens/utils/patterns.dart';

import 'LoginBloc.dart';

class LoginScreen extends BaseScreen {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginBloc>
    with ErrorDispatcher {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validate);
    _passwordController.addListener(_validate);
  }

  @override
  Widget body() {
    return ListView(
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    S.of(context).welcomeBack,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'asset/images/login.svg',
                  ),
                ),

                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 16, right: 16,top: 20),
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).enterYourEmail,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),

                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 16, right: 16,top: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).comfirmYourPassword,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute(
                              builder: (_) => ReflashPasswordScreen()));
                    },
                    child: Text(
                     S.of(context).forgetPassword,
                      style: const TextStyle(
                          color: AppColors.appColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _valueNotifier,
                  builder: (_, value, __) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.appColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.39),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: value ? _login : null,
                      child: Text(S.of(context).login),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     CupertinoPageRoute(builder: (BuildContext context) {
                    //   return RegistrationScreen();
                    // }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(S.of(context).dontHaveAnAccount,style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, CupertinoPageRoute(
                          //     builder: (BuildContext context) {
                          //   return RegistrationScreen();
                          // }));
                        },
                        child: Text(
                         S.of(context).signUp,
                          style: const TextStyle(
                              color: AppColors.appColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 46,
        )
      ],
    );
  }

  @override
  ErrorHandler get errorHandler => (error) {
        if (error.runtimeType == DioError &&
            (error as DioError).response?.statusCode == 401) {
          showSnackbar('E-poçt və ya parol səhvdir');
        }
        return false;
      };

  @override
  LoginBloc provideBloc() {
    return LoginBloc();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.email.hasMatch(_emailController.text.trim()) &&
        Patterns.password.hasMatch((_passwordController.text.trim()));
    _valueNotifier.value = isValid;
  }

  _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    bloc.login(email, password).then((value) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (BuildContext context) => HomeScreen())));
  }
}
