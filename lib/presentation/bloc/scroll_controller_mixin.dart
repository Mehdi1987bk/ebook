import 'package:flutter/material.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';
import 'package:kango/presentation/bloc/utils.dart';


import 'base_bloc.dart';
import 'base_screen.dart';

mixin ScrollControllerMixin<Page extends BaseScreen, Bloc extends PaginableBloc>
    on BaseState<Page, Bloc> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      hideKeyboardOnScroll(context, scrollController);
      if (scrollController.position.extentAfter <=
          MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
