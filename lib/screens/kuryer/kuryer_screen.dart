import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/tabs/menu/menu_drawer.dart';
import 'package:kango/screens/kuryer/kuryer_ithem.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:rxdart/rxdart.dart';

import '../../main.dart';

class KuryerScreen extends StatefulWidget {
  @override
  _KuryerScreenState createState() => _KuryerScreenState();
}

class _KuryerScreenState extends State<KuryerScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
            height: 90,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10))),
            width: MediaQuery.of(context).size.width * 0.94,
            child: Drawer(child: MenuDrawer())),
      ),
      key: scaffoldKey,
      body: Column(
        children: [
          Column(
            children: [
              HomeHeader(
                onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          ),

          Expanded(child: KuryerItem())
        ],
      ),
    );
  }
}
