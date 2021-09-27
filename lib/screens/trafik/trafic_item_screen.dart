import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/common/trafic_widget.dart';
import 'package:kango/presentation/common/user_details_declaration.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/trafik/tab_bar_buttons.dart';
import 'package:kango/screens/trafik/tabs/tabs_one_screen.dart';
import 'package:kango/screens/trafik/tabs/tabs_tow_screen.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:rxdart/rxdart.dart';

import '../../main.dart';

class TraficItem extends StatefulWidget {
  @override
  _TraficItemState createState() => _TraficItemState();
}

class _TraficItemState extends State<TraficItem>
    with SingleTickerProviderStateMixin {
  final PublishSubject<User> user = PublishSubject();
  final UserRepository _userRepository = sl.get<UserRepository>();
  late TabController _tabsController;
  final List<Widget> _tabs = [TabsOne(), TabsTow()];

  @override
  void initState() {
    super.initState();
    _userRepository.getUserDetails().then(user.add);
    _tabsController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SimpleDialogOption(
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
                  Text(S.of(context).geri,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
          UserDetailsDeclaration(user: user),
          Container(
            margin:
                const EdgeInsets.only(top: 31, bottom: 30, left: 16, right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
          Expanded(child: TraficWidget()),

        ],
      ),
    );
  }
}