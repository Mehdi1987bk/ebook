import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class BottomBar extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const BottomBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 77,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      widget.onChanged(_selectedIndex);
                    });
                  },
                  icon: SvgPicture.asset(
                    'asset/botton1.svg',
                    color: _selectedIndex == 0
                        ? AppColors.homeButtonBacgraund
                        : AppColors.homeButtonDontHover,
                    height: 28,
                  ),
                ),
                _selectedIndex == 0
                    ? Container(
                        decoration: const BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        height: 6,
                        width: 6,
                      )
                    : const SizedBox(
                        width: 6,
                        height: 6,
                      )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                      widget.onChanged(_selectedIndex);
                    });
                  },
                  icon: SvgPicture.asset(
                    'asset/botton2.svg',
                    color: _selectedIndex == 1
                        ? AppColors.homeButtonBacgraund
                        : AppColors.homeButtonDontHover,
                    height: 28,
                  ),
                ),
                _selectedIndex == 1
                    ? Container(
                        decoration: const BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        height: 6,
                        width: 6,
                      )
                    : const SizedBox(
                        width: 6,
                        height: 6,
                      )
              ],
            ),
            const SizedBox(
              width: 56,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                      widget.onChanged(_selectedIndex);
                    });
                  },
                  icon: SvgPicture.asset(
                    'asset/botton3.svg',
                    color: _selectedIndex == 2
                        ? AppColors.homeButtonBacgraund
                        : AppColors.homeButtonDontHover,
                    height: 28,
                  ),
                ),
                _selectedIndex == 2
                    ? Container(
                        decoration: const BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        height: 6,
                        width: 6,
                      )
                    : const SizedBox(
                        width: 6,
                        height: 6,
                      )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                      widget.onChanged(_selectedIndex);
                    });
                  },
                  icon: SvgPicture.asset(
                    'asset/botton4.svg',
                    color: _selectedIndex == 3
                        ? AppColors.homeButtonBacgraund
                        : AppColors.homeButtonDontHover,
                    height: 28,
                  ),
                ),
                _selectedIndex == 3
                    ? Container(
                        decoration: const BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        height: 6,
                        width: 6,
                      )
                    : const SizedBox(
                        width: 6,
                        height: 6,
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
