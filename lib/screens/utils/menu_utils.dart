import 'package:flutter/material.dart';
import 'package:kango/screens/home/tabs/menu/menu_drawer.dart';

class MenuUtils extends StatelessWidget {
  // ToDo menu height
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(10))),
          width: MediaQuery.of(context).size.width * 0.94,
          child: Drawer(child: MenuDrawer())),
    );
  }
}
