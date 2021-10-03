import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/common/user_details.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/declarations/declaration_tab_screen.dart';
import 'package:kango/screens/home/tabs/faktura_add/factura_add_item.dart';
import 'package:kango/screens/home/tabs/home/home_tab_screen.dart';
import 'package:kango/screens/home/tabs/setting/setting_screen.dart';
import 'package:kango/screens/utils/menu_utils.dart';

import 'bottom_bar.dart';
import 'home_header.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> notifier = ValueNotifier(0);
  final ValueNotifier<bool> optionsNotifier = ValueNotifier(false);


  @override
  void initState() {
    super.initState();
    sl.get<UserRepository>().updateLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: MenuUtils(),
      key: scaffoldKey,
      body: Stack(
        children: [
          Column(
            children: [
              HomeHeader(
                onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
              ),
              Expanded(
                  child: _Tabs(
                notifier: notifier,
              ))
            ],
          ),
          ValueListenableBuilder(
            valueListenable: optionsNotifier,
            builder: (_, bool value, Widget? child) {
              if (value) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap:() => optionsNotifier.value = !optionsNotifier.value,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 42),
                    color: AppColors.buttonText.withOpacity(0.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.man,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 127,
                                height: 50,
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11, right: 5),
                                        child: Image.asset('asset/union.png')),
                                    Text(
                                      S.of(context).sifariVer,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.onbording1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              // onTap: () => showDialog(
                              //     context: context, builder: (_) => InputTextd()),
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                                  return InputTextd();
                                }));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.man,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 127,
                                height: 50,
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11, right: 5),
                                        child: Image.asset('asset/union1.png')),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 6, left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.of(context).fakturaLavEt,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.buttun_appbar),
                                          ),
                                          Text(
                                            S.of(context).lavEt,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.buttun_appbar),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        onChanged: (index) => notifier.value = index,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(9),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: GestureDetector(
          onTap: _showOptions,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: AppColors.appColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('asset/plus_circle.svg'),
          ),
        ),
      ),
    );
  }

  _showOptions() {
    optionsNotifier.value = !optionsNotifier.value;
  }
}

class _Tabs extends StatefulWidget {
  final ValueNotifier<int> notifier;

  const _Tabs({Key? key, required this.notifier}) : super(key: key);

  @override
  __TabsState createState() => __TabsState();
}

class __TabsState extends State<_Tabs> {
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = <Widget>[
      HomeTab(),
      Container(),
      DeclarationTabScreen(),
      SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: widget.notifier,
        builder: (BuildContext context, value, Widget? child) {
          return Stack(
            children: [
              IndexedStack(
                index: value,
                children: _tabs,
              ),
            ],
          );
        });
  }
}
