import 'package:flutter/material.dart';
import 'package:kango/domain/entities/order_list.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

import 'kuryer_list_bloc.dart';
import 'order_list_widget.dart';

class KuryerListScreen extends BaseScreen {
  @override
  _KuryerListScreenState createState() => _KuryerListScreenState();
}

class _KuryerListScreenState
    extends BaseState<KuryerListScreen, KuryerListBloc> with ErrorDispatcher{
  @override
  void initState() {
    super.initState();
  bloc.load();
  }
  @override
  Widget body() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SimpleDialogOption(
            padding: EdgeInsets.only(bottom: 0, top: 25, left: 20),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              children: [
                Image.asset("asset/vektor_23.png"),
                const SizedBox(
                  width: 18,
                ),
                Text(S.of(context).kuryerSifariEt,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
        ),
        StreamBuilder<List<OrderList>>(
            stream: bloc.paginableList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter();
              }
              if (snapshot.data!.isEmpty) {
                //TODO
                return const SliverToBoxAdapter(child: Center(child: Text('You don order',)));
              }
              return OrderListWidget(
                orderList: snapshot.data!,
              );
            })
      ],
    );
  }

  @override
  KuryerListBloc provideBloc() {
    return KuryerListBloc();
  }
}
