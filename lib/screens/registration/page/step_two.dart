import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/utils/patterns.dart';

import '../registration_bloc.dart';

const dialCodes = ['055','070','077','050','051'];
const seriyaCodes = ['AZE', 'AA', 'MYİ', 'DYİ'];


class StepTwo extends StatefulWidget {
  final VoidCallback previousPage;

  final VoidCallback onNexStep;
  final RegistrationBloc bloc;

  const StepTwo(
      {Key? key,
      required this.onNexStep,
      required this.previousPage,
      required this.bloc})
      : super(key: key);

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> with AutomaticKeepAliveClientMixin{
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordAgain = TextEditingController();


  @override
  void initState() {
    super.initState();
    _phoneNumber.addListener(() {
      widget.bloc.secondPageInfo.phoneNumber = _phoneNumber.text.trim();
      _validate();
    });
    _password.addListener(() {
      widget.bloc.secondPageInfo.password = _password.text.trim();
      _validate();
    });
    _passwordAgain.addListener(_validate);
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).mobilNmrniz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _phoneNumber,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: DropdownSelector(
                values: dialCodes,
                onChanged: (String value) {
                  widget.bloc.secondPageInfo.dialCode = value;
                },
              ),
              hintText: S.of(context).ifrniziDaxilEdin,
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
              S.of(context).ifrniz,
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
              hintText: S.of(context).giriIfrniziTyinEdin,
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
              S.of(context).tkrarIfrniz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _passwordAgain,
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).tyinEtdiyinizGiriIfrsiniTkrarDaxilEdin,
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 45),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonBacgraund,
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: value ? widget.onNexStep : null,
                child: Text(S.of(context).rli),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            //widget.previousPage
              onPressed:() => Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                      (route) => false),
              child: Text(
                S.of(context).giriEt,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
        )      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _passwordAgain.dispose();
    _password.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  void _validate() {
    final isValid =
        Patterns.phone.hasMatch(widget.bloc.secondPageInfo.phoneNumber) &&
            Patterns.password.hasMatch(widget.bloc.secondPageInfo.password) &&
            widget.bloc.secondPageInfo.password == _passwordAgain.text;
    _valueNotifier.value = isValid;
  }
}

class DropdownSelector extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final List<String> values;

  const DropdownSelector(
      {Key? key, required this.onChanged, required this.values})
      : super(key: key);

  @override
  _DropdownSelectorState createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          itemHeight: 50.0,
          value: selectedValue,
          items: widget.values
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              if (selectedValue != null) {
                widget.onChanged(selectedValue!);
              }
            });
          },
        ),
      ),
    );
  }
}
