import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/text_style.dart';

class SettingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
          const EdgeInsets.only(bottom: 25, left: 20, right: 20, top: 31),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).xsiKabinet,
              style: TextStyles.styleText4,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only( top: 46, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/melumat.png'),
              ),
              Text(
                S.of(context).xsiMlumatlarm,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),  Container(
          padding: const EdgeInsets.only( top: 61, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/vill.png'),
              ),
              Text(
                S.of(context).xariciNvanlarm,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ), Container(
          padding: const EdgeInsets.only( top: 61, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/keya.png'),
              ),
              Text(
                S.of(context).ifrniDyi,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 61, left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset('asset/loqaut.png'),
              ),
              Text(
                S.of(context).xEt,
                style: TextStyles.styleText12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
