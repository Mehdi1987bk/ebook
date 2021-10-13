import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/payment/payment_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

class PaymentHome extends StatefulWidget {
  @override
  _PaymentHomeState createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 17.5),
          child: Align(alignment: Alignment.topLeft,child: Text(S.of(context).balansnz,style: TextStyles.styleText10,)),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.man,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderPayment)),
              height: 69,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 14, right: 5),
                      child: Image.asset('asset/union.png')),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.3, left: 11),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            S.of(context).aznBalans,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.borderPayment),
                          ),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                S.of(context).aznnnn,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.borderPayment,
                                ),
                              ),
                            ),
                            Image.asset(
                              'asset/azn.png',
                              width: 20,
                              height: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { return PaymentScreen(amount: 10); }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.man,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderPayment)),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 69,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 14, right: 5),
                        child: Image.asset('asset/union1.png')),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.3, left: 11),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              S.of(context).tlBalans,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.borderPayment),
                            ),
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  S.of(context).aznnnn,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.borderPayment,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'asset/azn.png',
                                width: 20,
                                height: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
