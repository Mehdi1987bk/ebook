import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class UserDetails extends StatelessWidget {
  final Stream<User> user;

  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return UserInfo(user: snapshot.data!);
        }
        return const SizedBox();
      },
      stream: user,
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;
  final Text code = const Text('KGO');
  final styleText = const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  final styleText1 = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600);
  final styleText2 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: AppColors.appColor);

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splBag,
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 10, 14, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: AppColors.man,
                      border: Border.all(color: AppColors.appColor)),
                  child: Image.asset(
                    'asset/man.png',
                    height: 54,
                    width: 54,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Text(user.firstName,style: styleText1,),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(user.lastName,style: styleText1,),
                        ],
                      )),
                  Row(
                    children: [
                       Text('KGO',style: styleText1,),
                      Text(user.id.toString(),style: styleText1,),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 23, left: 16, right: 41),
            child: Wrap(
              children: [
                Column(
                  children: [
                    RichText(
                        text:  TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(text: S.of(context).salam,style: styleText),
                              TextSpan(text:" " + user.firstName + " ", style: styleText2),
                              TextSpan(text: S.of(context).buGnSizXoAlverilrArzuEdirik,style: styleText),

                            ])),

                  ],
                ),
              ],
            ),
          ),
        Container(
          margin: EdgeInsets.only(top: 40,bottom: 33,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        )
        ],
      ),
    );
  }
}
