import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/screens/home/tabs/setting/add_user_cart/add_user_cart_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../../../../utils/patterns.dart';
import '../../../home_screen.dart';
import '../my_book_downlide/MyBookDownlideScreen.dart';

class AddUserCartScreen extends BaseScreen {
  @override
  _AddUserCartScreenState createState() => _AddUserCartScreenState();
}

class _AddUserCartScreenState
    extends BaseState<AddUserCartScreen, AddUserCartBloc> {
  final TextEditingController _expirationYearController =
      TextEditingController();
  final TextEditingController _expirationMonthController =
      TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cardholderNameController =
      TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _expirationYearController.addListener(_validate);
    _expirationMonthController.addListener(_validate);
    _numberController.addListener(_validate);
    _cardholderNameController.addListener(_validate);
  }

  @override
  Widget body() {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
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
                Text(S.of(context).kartElaveEt,
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
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              controller: _expirationYearController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).expirationYear,
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
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              controller: _expirationMonthController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).expirationMonth,
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
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              controller: _numberController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).number,
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
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              controller: _cardholderNameController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).cardholderName,
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
          ValueListenableBuilder<bool>(
            valueListenable: _valueNotifier,
            builder: (_, value, __) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.appColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: MediaQuery.of(context).size.width * 0.39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: value ? _login : null,
                  child: Text(S.of(context).login),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  @override
  AddUserCartBloc provideBloc() {
    return AddUserCartBloc();
  }

  @override
  void dispose() {
    _cardholderNameController.dispose();
    _numberController.dispose();
    _expirationYearController.dispose();
    _expirationMonthController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid =
        Patterns.userNames.hasMatch(_cardholderNameController.text.trim()) &&
            Patterns.phonefde.hasMatch(_expirationMonthController.text.trim()) &&
            Patterns.phonefde.hasMatch(_numberController.text.trim()) &&
            Patterns.phonefde.hasMatch(_expirationYearController.text.trim());
    _valueNotifier.value = isValid;
  }

  _login() {
    final cardholderName = _cardholderNameController.text;
    final expirationMonth = _expirationMonthController.text;
    final number = _numberController.text;
    final expirationYear = _expirationYearController.text;
    bloc.login(cardholderName, expirationMonth,number,expirationYear).then((value) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (BuildContext context) => MyBookDownlideScreen())));
  }
}
