import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/screens/home/tabs/setting/cart/cart_info_bloc.dart';

import '../../../../../data/network/response/get_user_cart_info.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../../../../utils/text_style.dart';
import '../add_user_cart/add_user_cart_screen.dart';

class CartInfoScreen extends BaseScreen {
  @override
  _CartInfoScreenState createState() => _CartInfoScreenState();
}

class _CartInfoScreenState extends BaseState<CartInfoScreen, CartInfoBlo> {
  @override
  Widget body() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: FutureBuilder<GetUserCartInfo>(
                future: bloc.userCart,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage('asset/images/world.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              snapshot.requireData.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).kartSahb,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    snapshot.requireData.cardholderName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BİTMƏ TARİXİ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    snapshot.requireData.updatedAt ?? '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ],
                      ),
                    );
                  }
                  return  Center(child: Text(S.of(context).sizinKartinizYoxdur),);
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (BuildContext context) {
                      return AddUserCartScreen();
                    }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 15),
                height: 50,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                        padding: const EdgeInsets.only(right: 0,),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.credit_card_rounded,
                          color: Colors.white,
                        )),

                    Text(
                      S.of(context).kartElaveEt,
                      style: TextStyles.styleText12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CartInfoBlo provideBloc() {
    return CartInfoBlo();
  }
}
