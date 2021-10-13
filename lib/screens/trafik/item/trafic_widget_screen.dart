import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kango/domain/entities/delivery_ariff.dart';
import 'package:kango/domain/entities/tariff_baku.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/screens/trafik/tab_bar_buttons.dart';
import 'package:kango/screens/trafik/tabs/tabs_one_screen.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../../main.dart';

const tarifPriceHeight = 44;
const tarifTabHeaderHeight = 42;

class TraficWidgetScreen extends StatefulWidget {
  @override
  _TraficWidgetScreenState createState() => _TraficWidgetScreenState();
}

class _TraficWidgetScreenState extends State<TraficWidgetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabsController;

  final OrderRepository _orderRepository = sl.get<OrderRepository>();
  late final Future<DeliveryTariff> traffic;
  late final Hecmsel hecmsel;

  @override
  void initState() {
    super.initState();
    _tabsController = TabController(length: 2, vsync: this);
    traffic = _orderRepository.getTariffs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 25,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  S.of(context).tariflrimiz,
                  style: TextStyles.styleText16,
                ),
                Text(
                  S.of(context).trkiydnAtdrlma,
                  style: TextStyles.styleText10,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TabBarButtons(
            controller: _tabsController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).standartAtdrlmaVMayeMhsullarZr,
              style: TextStyles.styleText17,
            ),
          ),
        ),
        FutureBuilder<DeliveryTariff>(
          future: traffic,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 250,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              final firstTabHeight =
                  snapshot.requireData.baku.prices.length * tarifPriceHeight +
                      tarifTabHeaderHeight;
              final secondTabHeight =
                  snapshot.requireData.regions.prices.length *
                          tarifPriceHeight +
                      tarifTabHeaderHeight;
              final tabBarViewHeight = max(firstTabHeight, secondTabHeight);
              return SizedBox(
                height: tabBarViewHeight.toDouble(),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabsController,
                  children: [
                    PrisesPlan(
                      price: snapshot.requireData.baku.prices,
                    ),
                    PrisesPlan(
                      price: snapshot.requireData.regions.prices,
                    )
                  ],
                ),
              );
            }
            return const SizedBox(
              height: 250,
            );
          },
        ),
        FutureBuilder<DeliveryTariff>(
          future: traffic,
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 17,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        snapshot.requireData.hecmsel.title,
                        style: TextStyles.styleText19,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        snapshot.requireData.hecmsel.desc,
                        style: TextStyles.styleText18, textAlign: TextAlign.justify,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                        ),
                        Text(
                          snapshot.requireData.hecmsel.price,
                          style: TextStyles.styleText20,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
