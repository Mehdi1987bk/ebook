import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/setting/update_password/password_update_true.dart';
import 'package:kango/screens/home/tabs/setting/update_password/update_password_bloc.dart';
import 'package:kango/screens/utils/patterns.dart';

class UpdatePasswordScreen extends BaseScreen {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState
    extends BaseState<UpdatePasswordScreen, UpdatePasswordBloc>
    with ErrorDispatcher {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _password = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _passwordConfirmationController.addListener(_validate);
    _passwordController.addListener(_validate);
    _password.addListener(_validate);
  }

  @override
  Widget body() {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        SimpleDialogOption(
          padding: const EdgeInsets.only(bottom: 0, top: 0, left: 20),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: Row(
            children: [
              SvgPicture.asset(
                'asset/vektor_23.svg',
                height: 18,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(S.of(context).changePassword,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600))
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).yourPassword,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _password,
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).enterYourPassword,
              hintStyle: const TextStyle(color: AppColors.buttonText),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.appColor)),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).yourNewPassword,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _passwordConfirmationController,
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).enterYourNewPassword,
              hintStyle: const TextStyle(color: AppColors.buttonText),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.appColor)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).yourPasswordAgain,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).reenterYourNewPassword,
              hintStyle: const TextStyle(color: AppColors.buttonText),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.appColor)),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _valueNotifier,
          builder: (_, value, __) {
            return Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.appColor,
                    padding: EdgeInsets.symmetric(
                        vertical: 20,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: value ? _edit : null,
                child: Text(S.of(context).save),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  UpdatePasswordBloc provideBloc() {
    return UpdatePasswordBloc();
  }

  @override
  void dispose() {
    _passwordConfirmationController.dispose();
    _passwordController.dispose();
    _password.dispose();
    super.dispose();
  }

  void _validate() {
    final isValid = Patterns.password
            .hasMatch(_passwordConfirmationController.text.trim()) &&
        Patterns.password.hasMatch((_passwordController.text.trim())) &&
        Patterns.password.hasMatch((_password.text.trim()));
    _valueNotifier.value = isValid;
  }

  _edit() {
    final passwordNew = _passwordConfirmationController.text;
    final passwordNewTow = _passwordController.text;
    final password = _password.text;
    bloc.updatePassword(passwordNew,passwordNewTow, password).then((value) =>
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => PasswordUpdateTrue())));
  }
}
