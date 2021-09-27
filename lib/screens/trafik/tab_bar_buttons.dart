import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class TabBarButtons extends StatefulWidget {
  final TabController controller;

  const TabBarButtons({Key? key, required this.controller}) : super(key: key);

  @override
  _TabBarButtonsState createState() => _TabBarButtonsState();
}

class _TabBarButtonsState extends State<TabBarButtons> {
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child:  TabBarButton(
          text: S.of(context).bakVSumqaytHrlriZr,
          selected: selectedTab == 1,
          onTap: () {
            widget.controller.animateTo(0);
            setState(() {
              selectedTab = 1;
            });
          },
        )),
        const SizedBox(
          width: 17,
        ),
        Expanded(
            child: TabBarButton(
          text: S.of(context).gncMingevirVLnkranHrlriZr,
          selected: selectedTab == 0,
          onTap: () {
            widget.controller.animateTo(1);
            setState(() {
              selectedTab = 0;
            });
          },
        )),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

class TabBarButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool selected;

  const TabBarButton(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border:
              selected ? null : Border.all(color: AppColors.traficButtonBorder),
          borderRadius: BorderRadius.circular(10),
          color: selected ? Colors.white : null,
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 5),
                      blurRadius: 3.0,
                      spreadRadius: 1.0),
                ]
              : [],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
