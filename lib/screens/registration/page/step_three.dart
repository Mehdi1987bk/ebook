import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

import '../registration_bloc.dart';

class StepThree extends StatefulWidget {
  final VoidCallback onNexStep;
  final VoidCallback previousPage;
  final RegistrationBloc bloc;

  const StepThree({Key? key,required this.onNexStep,required this.previousPage, required this.bloc}) : super(key: key);

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).ifr,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).ifrniziDaxilEdin,
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
        ),        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).ifr,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).ifrniziDaxilEdin,
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
        ),        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).ifr,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).ifrniziDaxilEdin,
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
        ),        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Text(
              S.of(context).ifr,
              style: const TextStyle(color: AppColors.appColor),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            obscureText: true,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              hintText: S.of(context).ifrniziDaxilEdin,
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
        ValueListenableBuilder<bool>(
          valueListenable: _valueNotifier,
          builder: (_, value, __) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonBacgraund,
                  padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal:
                      MediaQuery.of(context).size.width * 0.42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: value ? widget.onNexStep : null,
              child: Text(S.of(context).rli),
            );
          },
        ),
        TextButton(onPressed: widget.previousPage, child: Text("dfdfd"))

      ],
    );
  }
}
