import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:kango/screens/kuryer/kuryer_bloc.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class KuryerItem extends BaseScreen {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends BaseState<KuryerItem, KuryerBloc> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final PublishSubject<User> user = PublishSubject();

  final UserRepository _userRepository = sl.get<UserRepository>();

  @override
  void initState() {
    super.initState();
    _userRepository.getUserDetails().then(user.add);
  }

  @override
  Widget body() {
    return Container(
      color: AppColors.splBag,
      child: ListView(
        children: [
          Row(
            children: [
              UserDetailsDeclaration(user: user),
              const Spacer(),
              Container(
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
                  ))
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
                    const Spacer(),
                    const Text(
                      '3',
                      style: TextStyles.styleText11,
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
                    Expanded(
                      child: DottedLine(
                        dashLength: 30,
                        dashGapLength: 30,
                        lineThickness: 30,
                      ),
                    ),
                    const Text(
                      '5',
                      style: TextStyles.styleText11,
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {},
              child: Text(S.of(context).yaddaSaxla),
            ),
          ),
        ],
      ),
    );
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
