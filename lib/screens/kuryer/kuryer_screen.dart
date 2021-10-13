import 'package:flutter/material.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/kuryer/kuryer_ithem.dart';
import 'package:kango/screens/utils/menu_utils.dart';

class KuryerScreen extends StatefulWidget {
  @override
  _KuryerScreenState createState() => _KuryerScreenState();
}

class _KuryerScreenState extends State<KuryerScreen> with RouteAware{
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
          Expanded(child: KuryerItemScreen())
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
