
import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/home/home_screen.dart';
import 'package:kango/screens/home/tabs/setting/update_password/update_password_screen.dart';

import '../../../../../main.dart';


class TrafikScreen extends StatefulWidget {
  @override
  PasswordEditWidget createState() => PasswordEditWidget();
}

class PasswordEditWidget extends State<TrafikScreen> with RouteAware{
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
          Expanded(child: UpdatePasswordScreen()),
        ],
      ),
    );
  }
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

}
