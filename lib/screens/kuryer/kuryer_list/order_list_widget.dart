import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/order_list.dart';
import 'package:kango/domain/entities/request_packages.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class OrderListWidget extends StatelessWidget {
  final List<OrderList> orderList;

  const OrderListWidget({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return ExpandableNotifier(
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
            child: Builder(
              builder: (context) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ExpandablePanel(
                  collapsed: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 19, top: 15, left: 15, right: 15),
                    child: _ShortInfo(
                      status: Text(
                        orderList[index].statusStr,
                        style: TextStyle(
                            color: Color(int.tryParse(
                                    'FF${orderList[index].statusColor}',
                                    radix: 16) ??
                                0),fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      requestPackages: orderList[index].requestPackages.first,
                      widget: Row(
                        children: [
                          Text(
                            orderList[index].updatedAt.toString(),
                            style: TextStyle(
                                color: AppColors.borderPayment.withOpacity(0.5),
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Image.asset('asset/raund1.png'),
                        ],
                      ),
                    ),
                  ),
                  expanded: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 15, left: 15, right: 15),
                        child: Column(
                          children: [
                            _ShortInfo(
                              widget: Row(
                                children: [
                                  Text(orderList[index].updatedAt.toString(),
                                      style: TextStyle(
                                          color: AppColors.borderPayment
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Image.asset('asset/raund2.png'),
                                ],
                              ),
                              requestPackages:
                                  orderList[index].requestPackages.first,
                              status: Text(
                                orderList[index].statusStr,
                                style: TextStyle(
                                    color: Color(int.tryParse(
                                            'FF${orderList[index].statusColor}',
                                            radix: 16) ??
                                        0),fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            _ShortInfo2(
                              name:
                                  '${orderList[index].user.firstName} ${orderList[index].user.lastName}',
                              address: orderList[index].address,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }, childCount: orderList.length));
  }
}

class _ShortInfo extends StatelessWidget {
  final styleText1 = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.borderPayment);
  final styleText2 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.borderPayment);
  final styleText3 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.borderPayment);
  final styleText6 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.borderPayment);
  final styleText4 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.borderPayment);
  final styleText5 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.borderPayment);
  final Widget status;
  final RequestPackages requestPackages;
  final Widget widget;

  const _ShortInfo({
    Key? key,
    required this.status,
    required this.requestPackages,
    required this.widget,
  }) : super(key: key);

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
          widget,
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).balama} ',
                style: styleText3,
              ),
              Text(
                'KGO',
                style: styleText6,
              ),
              Text(
                requestPackages.packageId.toString(),
                style: styleText6,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).status} ',
                style: styleText3,
              ),
              status,
            ],
          ),
        ],
      ),
    );
  }
}

class _ShortInfo2 extends StatelessWidget {
  final styleText1 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final styleText2 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  final styleText3 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  final styleText6 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  final styleText4 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.bluyeAppasiti);
  final styleText5 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  final String address;
  final String name;

  const _ShortInfo2({
    Key? key,
    required this.address,
    required this.name,
  }) : super(key: key);

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
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).adSoyad} ',
                style: styleText3,
              ),
              Text(
                name,
                style: styleText6,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).nvan} ',
                style: styleText3,
              ),
              Text(
                address,
                style: styleText6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
