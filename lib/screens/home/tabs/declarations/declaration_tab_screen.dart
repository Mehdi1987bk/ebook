import 'package:flutter/material.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/utils.dart';
import 'package:kango/presentation/common/user_details.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/tabs/declarations/declarations_orders/order_list.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../home_screen.dart';
import 'declaration_tab_bloc.dart';

class DeclarationTabScreen extends BaseScreen {
  @override
  _DeclarationTabScreen createState() => _DeclarationTabScreen();
}

class _DeclarationTabScreen
    extends BaseState<DeclarationTabScreen, DeclarationBloc> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.load();
    _scrollController.addListener(() {
      hideKeyboardOnScroll(context, _scrollController);
      if (_scrollController.position.extentAfter <=
          MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  Widget body() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverToBoxAdapter(),
         SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(top: 28),
              child: UserDetails(),
            )),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 31,bottom: 33,left: 16,right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, ),
                child: Text(
                  S.of(context).balamalarm,
                  style: TextStyles.styleText4,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(18),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.homeButtonBacgraund,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 14, bottom: 14, right: 21),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).btnBalamalarm,
                        textAlign: TextAlign.start,
                        style: TextStyles.styleText3,
                      ),
                      const Spacer(),
                      Image.asset(
                        'asset/navigate.png',
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
        StreamBuilder<List<Declaration>>(
            stream: bloc.paginableList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter();
              }
              if (snapshot.data!.isEmpty) {
                //TODO
                return const SliverToBoxAdapter(child: Text('You don order'));
              }
              return ProductList(snapshot.data!);
            })
      ],
    );
  }

  @override
  DeclarationBloc provideBloc() {
    return DeclarationBloc();
  }
}
