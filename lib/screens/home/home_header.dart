import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomCenter,
      height: MediaQuery
          .of(context)
          .padding
          .top + 80,
      decoration: const BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
          image: DecorationImage(image: AssetImage('asset/vector.png'))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Image.asset('asset/menu.png'),
              onTap: () {},
            ),
          ), Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Image.asset('asset/story.png'),
              onTap: () {},
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Image.asset('asset/box.png'),
              onTap: () {},
            ),
          ), Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Image.asset('asset/sms.png'),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
