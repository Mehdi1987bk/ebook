import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/kuryer/kuryer_bloc.dart';
import 'package:kango/screens/utils/patterns.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'kuryer_list/kuryer_list.dart';
import 'kuryer_list/kuryer_list_screen.dart';

class KuryerItemScreen extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<KuryerItemScreen, KuryerBloc>
    with ErrorDispatcher {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final PublishSubject<User> user = PublishSubject();

  final UserRepository _userRepository = sl.get<UserRepository>();
  final TextEditingController _kurController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _userRepository.getUserDetails().then(user.add);
    _kurController.addListener(_validate);
  }

  @override
  Widget body() {
    return Container(
      color: AppColors.splBag,
      child: ListView(
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.only(bottom: 0,top: 0,left: 20),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              children: [
                Image.asset("asset/vektor_23.png"),
                const SizedBox(
                  width: 18,
                ),
                Text(S.of(context).anaShif,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
          Row(
            children: [
              UserDetailsDeclaration(user: user),
              const Spacer(),
              GestureDetector(
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 8, top: 8),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).kuryerSifarii,
                          style: TextStyles.styleText13,
                        ),
                        Text(
                          S.of(context).tarixsi,
                          style: TextStyles.styleText13,
                        ),
                      ],
                    )),
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { return KueyerList(); }));
                }
              )
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(bottom: 25, left: 20, right: 20, top: 31),
            height: 1,
            color: AppColors.appColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).kuryerTariflri,
                style: TextStyles.styleText4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 11),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).srtliPotDamaXidmti,
                style: TextStyles.styleText14,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(S.of(context).bakHrDaxili),
                    const Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ),
                    const Text(
                      '3',
                      style: TextStyles.styleText15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 2),
                      child: Image.asset(
                        'asset/aznblu.png',
                        width: 11.5,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(S.of(context).bakKndlri),
                    const Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ),
                    const Text(
                      '5',
                      style: TextStyles.styleText15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 2),
                      child: Image.asset(
                        'asset/aznblu.png',
                        width: 11.5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 7, right: 20, bottom: 11),
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                  color: AppColors.splBag.withOpacity(1),
                )),
                color: AppColors.splBag.withOpacity(0.9),
                onPressed: () => {calNumber('tel:012 525 43 43')},
                child: Row(
                  children: [
                    Image.asset('asset/phone-fill.png'),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      S.of(context).kangoTel0125254343,
                      style: TextStyles.styleText6,
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 60),
            child: Text(
              S.of(context).qeydKuryerDiniNdKildBalamanzAtdranKuryerDycksiniz,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).kuryerSifariiSadcNrimanovFilialNKerlidir,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 14, top: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).kuryerTariflri,
                style: TextStyles.styleText4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).nvannzQeydEdin,
              ),
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.only(
              left: 20,
              right: 16,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 140.0,
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: SizedBox(
                    height: 140.0,
                    child: TextField(
                      controller: _kurController,
                      maxLines: 140,
                      decoration: InputDecoration(
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
                ),
              ),
            ),
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            margin: const EdgeInsets.only(top: 30, bottom: 68),
            child: ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (_, value, __) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: value ? _kur : null,
                    child: Text(S.of(context).tsdiqlVSifariEt));
              },
            ),
          ),
        ],
      ),
    );
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_kurController.text.trim());
    _valueNotifier.value = isValid;
  }

  _kur() {
    final address = _kurController.text;
    bloc.kuryer(address).then((value) => Navigator.pushReplacement(context,
        CupertinoPageRoute(builder: (BuildContext context) => HomeScreen())));
  }

  @override
  KuryerBloc provideBloc() {
    return KuryerBloc();
  }


}

void calNumber(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else
    print("Error  $command");
}
