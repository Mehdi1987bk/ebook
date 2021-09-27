import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/tabs/menu/menu_drawer.dart';
import 'package:kango/screens/utils/menu_utils.dart';

import 'kuryer_list_screen.dart';

class KueyerList extends StatefulWidget {
  @override
  _KueyerListState createState() => _KueyerListState();
}

class _KueyerListState extends State<KueyerList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
         return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: MenuUtils(),
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
          Expanded(child: KuryerListScreen())
        ],
      ),
    );
  }
}
