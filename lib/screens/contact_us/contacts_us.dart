import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/common/user_details.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/kuryer/kuryer_ithem.dart';
import 'package:kango/screens/utils/menu_utils.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../main.dart';

class ContactsUs extends StatefulWidget {
  @override
  _ContactsUsState createState() => _ContactsUsState();
}

class _ContactsUsState extends State<ContactsUs> with RouteAware {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: AppColors.splBag,
        drawer: MenuUtils(),
        key: scaffoldKey,
        body: Column(
          children: [
            HomeHeader(
              onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SimpleDialogOption(
                    padding:
                        const EdgeInsets.only(bottom: 27, top: 0, left: 20),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset('asset/vektor_23.png'),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(S.of(context).laq,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  height: 1,
                  color: AppColors.appColor,
                ),
                UserDetails(),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 16, right: 16, top: 31),
                  height: 1,
                  color: AppColors.appColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21, top: 30),
                          child: Row(
                            children: [
                              Image.asset('asset/phone-fill.png'),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                S.of(context).telefonNmrlrimiz,
                                style: TextStyles.styleText6,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 21,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => {calNumber('tel:012 525 43 43')},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, left: 35),
                                child: Text(
                                  S.of(context).number1,
                                  style: TextStyles.styleText23,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 21,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => {calNumber('tel:050 253 8907')},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, left: 35),
                                child: Text(
                                  S.of(context).number3,
                                  style: TextStyles.styleText23,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 16, right: 16, top: 30),
                          height: 1,
                          color: AppColors.appColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21, top: 20),
                          child: Row(
                            children: [
                              Image.asset('asset/phone-fill.png'),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                S.of(context).nvand,
                                style: TextStyles.styleText6,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, top: 10),
                          child: Text(
                            S
                                .of(context)
                                .bakHriNrimanovRayonuAaNeymatullaB442MetroparkTm,
                            style: TextStyles.styleText23,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 16, right: 16, top: 30),
                          height: 1,
                          color: AppColors.appColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21, top: 20),
                          child: Row(
                            children: [
                              Image.asset('asset/phone-fill.png'),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                S.of(context).nvand,
                                style: TextStyles.styleText6,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 55, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'office@kango.az',
                              style: TextStyles.styleText23,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    selectedMenuIndex = -1;
    super.didPop();
  }
}
