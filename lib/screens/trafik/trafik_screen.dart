
import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/trafik/trafic_item_screen.dart';
import 'package:kango/screens/utils/menu_utils.dart';

import '../../main.dart';


class TrafikScreen extends StatefulWidget {
  @override
  _TrafikScreenState createState() => _TrafikScreenState();
}

class _TrafikScreenState extends State<TrafikScreen> with RouteAware{
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
          Column(
            children: [
              HomeHeader(
                onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          ),
          Expanded(child: TraficItem()),
        ],
      ),
    );
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
