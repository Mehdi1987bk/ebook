import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onMenuTap;
  final bool showCard;
  final bool actionaly;
  final bool usePushReplacement;

  const HomeHeader({Key? key,
    required this.onMenuTap,
    this.showCard = true,
    this.actionaly = true,
    this.usePushReplacement = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          if (showCard)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                          return Container();
                        }));
                  },
                  icon: SvgPicture.asset(
                    'asset/box.svg',
                    height: 28,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
