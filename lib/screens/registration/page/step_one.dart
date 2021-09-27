import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kango/domain/entities/gender.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/bloc_provider.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/registration/registration_bloc.dart';
import 'package:kango/screens/utils/patterns.dart';

class StepOne extends StatefulWidget {
  final VoidCallback onNexStep;
  final VoidCallback previousPage;
  final RegistrationBloc bloc;

  const StepOne(
      {Key? key,
      required this.onNexStep,
      required this.previousPage,
      required this.bloc})
      : super(key: key);

  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(true);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final dateFormat = DateFormat('yyyy-MM-dd');
  final firstDate = DateTime(1960, 1);
  final lastDate = DateTime.now();

  RegistrationBloc get _bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(
      () {
        _bloc.firstPageInfo.firstName = _firstNameController.text.trim();
        _validate();
      },
    );
    _lastNameController.addListener(
      () {
        _bloc.firstPageInfo.lastName = _lastNameController.text.trim();
        _validate();
      },
    );
    _emailController.addListener(
      () {
        _bloc.firstPageInfo.email = _emailController.text.trim();
        _validate();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).adnz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _firstNameController,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).adnzDaxilEdin,
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
              S.of(context).soyadnz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _lastNameController,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).soyadnzDaxilEdin,
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
              S.of(context).doumTarixiniz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            readOnly: true,
            controller: _dateTimeController,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  child: Image.asset('asset/data_d.png'),
                  onTap: () => _openDataPicker(context)),
              hintText: S.of(context).doumTarixiniziQeydEdin,
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
              S.of(context).cinsiniz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        GenderSelector(
          bloc: _bloc,
          onChanged: _validate,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).emailAdresiniz,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _emailController,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).emailAdresiniziDaxilEdin,
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
                    )),
                onPressed: value ? widget.onNexStep : null,
                child: Text(S.of(context).rli),
              ),
            );
          },
        ),
        TextButton(
            onPressed: widget.previousPage, child: Text(S.of(context).giriEt))
      ],
    );
  }

  void _openDataPicker(BuildContext context) async {
    final date = await showDatePicker(
      initialDate: _bloc.firstPageInfo.birthday ?? DateTime.now(),
      firstDate: firstDate,
      context: context,
      lastDate: lastDate,
    );
    if (date != null) {
      _bloc.firstPageInfo.birthday = date;

      _dateTimeController.text =
          dateFormat.format(_bloc.firstPageInfo.birthday!);
    }
    _validate();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateTimeController.dispose();
    _emailController.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  void _validate() {
    final isValid = Patterns.userName.hasMatch(_bloc.firstPageInfo.firstName) &&
        Patterns.userName.hasMatch(_bloc.firstPageInfo.lastName) &&
        Patterns.email.hasMatch(_bloc.firstPageInfo.email) &&
        _bloc.firstPageInfo.birthday != null &&
        _bloc.firstPageInfo.gender != null;
    _valueNotifier.value = isValid;
  }
}

class GenderSelector extends StatefulWidget {
  final RegistrationBloc bloc;
  final VoidCallback onChanged;

  const GenderSelector({Key? key, required this.bloc, required this.onChanged})
      : super(key: key);

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
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
          child: DropdownButton<Gender>(
            hint: Text(S.of(context).cins),
            isExpanded: true,
            itemHeight: 50.0,
            value: widget.bloc.firstPageInfo.gender,
            items: [
              DropdownMenuItem(
                child: Text(S.of(context).kii),
                value: Gender.male,
              ),
              DropdownMenuItem(
                child: Text(S.of(context).qadn),
                value: Gender.female,
              )
            ],
            onChanged: (value) {
              setState(() {
                widget.bloc.firstPageInfo.gender = value;
                widget.onChanged();
              });
            },
          ),
        ),
      ),
    );
  }
}
