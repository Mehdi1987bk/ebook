import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/contact.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/login/login_screen.dart';
import 'package:kango/screens/registration/page/step_two.dart';
import 'package:kango/screens/utils/patterns.dart';

import '../registration_bloc.dart';

class StepThree extends StatefulWidget {
  final VoidCallback onNexStep;
  final VoidCallback previousPage;
  final RegistrationBloc bloc;

  const StepThree(
      {Key? key,
      required this.onNexStep,
      required this.previousPage,
      required this.bloc})
      : super(key: key);

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> with AutomaticKeepAliveClientMixin{
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _seriyaNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _finCodsNumber = TextEditingController();


  RegistrationBloc get _bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    _seriyaNumber.addListener(
          () {
        _bloc.thirdPageInfo.pasportNumber = _seriyaNumber.text.trim();
        _validate();
      },
    );
    _finCodsNumber.addListener(
          () {
        _bloc.thirdPageInfo.pasportFin = _finCodsNumber.text.trim();
        _validate();
      },
    );
    _address.addListener(
          () {
        _bloc.thirdPageInfo.address = _address.text.trim();
        _validate();
      },
    );
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
              S.of(context).xsiyytVsiqsininSeriyaNmrsi,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _seriyaNumber,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: DropdownSelector(
                values: seriyaCodes,
                onChanged: (String value) {
                  widget.bloc.thirdPageInfo.pasportSeria = value;
                },
              ),
              hintText: S.of(context).vNinSeriyaNmrsi,
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
            S.of(context).xsiyytVsiqsininFnKodu,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _finCodsNumber,
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
             S.of(context).nvan,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _address,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).nvannzDaxilEdin,
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
              S.of(context).filialSein,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        ListContact(
          bloc: _bloc,
          onChanged: _validate,
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
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: value ? widget.onNexStep : null,
                child: Text(S.of(context).qeydiyyatdanKein),
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
    _seriyaNumber.dispose();
    _valueNotifier.dispose();
    _address.dispose();
    _finCodsNumber.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  void _validate() {
    final isValid = RegExp(r'^.{7,8}$').hasMatch(_bloc.thirdPageInfo.pasportNumber) &&
        Patterns.phone.hasMatch(_bloc.thirdPageInfo.pasportFin) &&
        Patterns.textField.hasMatch(_bloc.thirdPageInfo.address);

    _valueNotifier.value = isValid;
  }
}



class ListContact extends StatefulWidget {
  final RegistrationBloc bloc;
  final VoidCallback onChanged;

  const ListContact({Key? key, required this.bloc, required this.onChanged})
      : super(key: key);

  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: widget.bloc.contactList,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Contact>(
                  hint: Text(S.of(context).cins),
                  isExpanded: true,
                  itemHeight: 50.0,
                  value: widget.bloc.thirdPageInfo.fillial,
                  items: snapshot.data!.map<DropdownMenuItem<Contact>>((e) =>
                      DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      )).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.bloc.thirdPageInfo.fillial = value;
                      widget.onChanged();
                    });
                  },
                ),
              ),
            ),
          );
        } return const SizedBox();
      }
    );
  }
}
