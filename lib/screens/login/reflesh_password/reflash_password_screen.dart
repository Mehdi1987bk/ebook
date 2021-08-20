import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/login/reflesh_password/reflash_password_bloc.dart';

class ReflashPasswordScreen extends BaseScreen {
  @override
  _ReflashPasswordScreenState createState() => _ReflashPasswordScreenState();
}

class _ReflashPasswordScreenState
    extends BaseState<ReflashPasswordScreen, ReflashPasswordBloc> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget body() {
    return Container(
      padding: const EdgeInsets.only(bottom: 46, top: 75),
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/bagraund_nbord.jpg'),
                  fit: BoxFit.fitHeight),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'asset/group967.png',
                      fit: BoxFit.fitWidth,
                      width: 180,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.of(context).ifrmiUnutmusam,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44, right: 44),
                    child: Text(
                      S.of(context).loginDescribtion,
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 5, top: 25),
                      child: Text(
                        S.of(context).emailAdres,
                        style: const TextStyle(color: AppColors.appColor),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      controller: _emailController,
                      obscureText: true,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "E-mail addresinizi daxil edin",
                        hintStyle: const TextStyle(color: AppColors.buttonText),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.appColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.appColor)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.buttonBacgraund,
                        padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      //TODO
                    },
                    child: Text(S.of(context).rli),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          S.of(context).qeydiyyatdanKein,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
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
        ],
      ),
    );
  }

  @override
  ReflashPasswordBloc provideBloc() {
    return ReflashPasswordBloc();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
