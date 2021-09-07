import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/order.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/faktura_add/factura_add.dart';

import 'order_dialog.dart';

class DeclarationItem extends StatefulWidget {
  final Declaration declaration;

  const DeclarationItem({Key? key, required this.declaration})
      : super(key: key);

  @override
  _DeclarationItemState createState() => _DeclarationItemState();
}

class _DeclarationItemState extends State<DeclarationItem> {
  final styleText2 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.appColor);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
          child: Builder(
            builder: (context) => Card(
              child: ExpandablePanel(
                collapsed: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 19, top: 15, left: 15, right: 15),
                  child: _ShortInfo(
                    declaration: widget.declaration,
                  ),
                ),
                expanded: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, top: 15, left: 15, right: 15),
                      child: _ShortInfo(
                        declaration: widget.declaration,
                      ),
                    ),
                    _OrderInfo(
                      declaration: widget.declaration,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShortInfo extends StatelessWidget {
  final Declaration declaration;
  final styleText1 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final styleText2 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  final styleText3 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  final styleText4 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.bluyeAppasiti);
  final styleText5 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.onbording1);

  const _ShortInfo({Key? key, required this.declaration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        var controller = ExpandableController.of(context, required: true)!;
        controller.toggle();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).mhsulunKodu,
            style: styleText2,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'KGO',
                style: styleText1,
              ),
              Text(
                declaration.userId.toString(),
                style: styleText1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                S.of(context).scStatus,
                style: styleText3,
              ),
              Text(
                declaration.scStatus.toString(),
                style: styleText5,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OrderInfo extends StatelessWidget {
  final Declaration declaration;

  const _OrderInfo({Key? key, required this.declaration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = <Widget>[];
    declaration.orders.forEach((e) {
      orders.add(OrderItem(
        order: e,
        declaration: declaration,
      ));
      orders.add(const Divider());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...orders,
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final Order order;
  final Declaration declaration;
  final styleText1 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  final styleText3 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  final styleText4 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  final styleText2 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.appColor);

  const OrderItem({Key? key, required this.order, required this.declaration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => { showDialog(
        context: context, builder: (_) => OrderInfoDialog(order: order,))},
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 22,
              ),
              height: 0.5,
              color: AppColors.appColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).qiymt,
                  style: styleText1,
                ),
                Text(
                  declaration.ordersTotal.toString(),
                  style: styleText3,
                ),
                const Spacer(),
                Container(
                  width: 125,
                  child: Row(children: [
                    Text(
                      S.of(context).maaza,
                      style: styleText1,
                    ),
                    Text(
                      declaration.cargoWeight,
                      style: styleText3,
                    ),
                  ]),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).mhsulunTipi,
                  style: styleText1,
                ),
                Text(
                  declaration.cargoWeight.toString(),
                  style: styleText3,
                ),
                const Spacer(),
                Container(
                  width: 125,
                  child: Row(children: [
                    Text(
                      S.of(context).kargoKisi,
                      style: styleText1,
                    ),
                    Text(
                      declaration.cargoTotal,
                      style: styleText3,
                    ),
                  ]),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).kargoQiymti,
                  style: styleText1,
                ),
                Text(
                  declaration.cargoWeight.toString(),
                  style: styleText3,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 17, top: 20),
              height: 0.5,
              color: AppColors.appColor,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).qeyd,
                  style: styleText3,
                )),
            const SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  declaration.ordersTotalUsd,
                  style: styleText4,
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 12, top: 13),
              height: 0.5,
              color: AppColors.appColor,
            ),
            EditPaymentOrders(order: order,)
          ],
        ),
      ),
    );
  }
}

class EditPaymentOrders extends StatelessWidget {
  final Order order;

  final styleText4 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.onbording1);

  const EditPaymentOrders({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'asset/pen.png',
                height: 23,
                width: 23,
              ),
            ),
          ),
          const Spacer(),
          Container(
              width: 158,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.onbording1,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 11),
                    margin: const EdgeInsets.all(6),
                    child: Text(S.of(context).dniEdin, style: styleText4),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset('asset/cart.png'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
