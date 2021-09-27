import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/screens/trafik/tab_bar_buttons.dart';
import 'package:kango/screens/trafik/tabs/tabs_one_screen.dart';
import 'package:kango/screens/trafik/tabs/tabs_tow_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

class TraficWidget extends StatefulWidget {
  @override
  _TraficWidgetState createState() => _TraficWidgetState();
}

class _TraficWidgetState extends State<TraficWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabsController;
  final List<Widget> _tabs = [TabsOne(), TabsTow()];

  @override
  void initState() {
    super.initState();
    _tabsController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 25,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  S.of(context).tariflrimiz,
                  style: TextStyles.styleText16,
                ),
                Text(
                  S.of(context).trkiydnAtdrlma,
                  style: TextStyles.styleText10,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TabBarButtons(
            controller: _tabsController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).standartAtdrlmaVMayeMhsullarZr,
              style: TextStyles.styleText17,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabsController,
            children: _tabs,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 17,
            bottom: 10,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).hcmslMhsullarZr,
                  style: TextStyles.styleText19,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).trfininEnUzunluHndrlkCmi1MetrdnOxOlanBalamalar,
                  style: TextStyles.styleText18,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 110,
                  ),
                  const Text(
                    'x 3.49',
                    style: TextStyles.styleText20,
                  ),
                  Image.asset(
                    'asset/dollar.png',
                    width: 14.5,
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }

}
