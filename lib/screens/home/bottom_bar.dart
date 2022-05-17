import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_screen.dart';

import '../../domain/entities/book.dart';
import '../../domain/entities/pagination.dart';

final GlobalKey<BottomBarState> bottomBarKey = GlobalKey();

class BottomBar extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final Future<List<Book>?> authorBooks;

  BottomBar({required this.onChanged, required this.authorBooks})
      : super(key: bottomBarKey);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.appColor),
      height: 60,
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
                  'asset/images/home.svg',
                  color: _selectedIndex == 0
                      ? Colors.black87
                      : AppColors.homeButtonDontHover,
                  height: 28,
                ),
              ),
              _selectedIndex == 0
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
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
                  'asset/images/lib.svg',
                  color: _selectedIndex == 1
                      ? Colors.black87
                      : AppColors.homeButtonDontHover,
                  height: 28,
                ),
              ),
              _selectedIndex == 1
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
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
          FutureBuilder<List<Book>?>(
              future: widget.authorBooks,
              builder: (context, snapshot) {
                //Todo Author Book Add
                if (snapshot.hasData ) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.onChanged(5);
                        },
                        icon: SvgPicture.asset(
                          'asset/images/kolok.svg',
                          color:   AppColors.homeButtonDontHover,
                          height: 28,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                        height: 6,
                      )
                    ],
                  );
                }
                return const SizedBox();
              }),
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
                  'asset/images/user.svg',
                  color: _selectedIndex == 2
                      ? Colors.black87
                      : AppColors.homeButtonDontHover,
                  height: 28,
                ),
              ),
              _selectedIndex == 2
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
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
                  'asset/images/setting.svg',
                  color: _selectedIndex == 3
                      ? Colors.black87
                      : AppColors.homeButtonDontHover,
                  height: 28,
                ),
              ),
              _selectedIndex == 3
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
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
    );
  }

  void navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onChanged(index);
    });
  }
}
