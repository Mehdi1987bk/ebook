import 'package:flutter/material.dart';
import 'package:kango/domain/entities/message.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/presentation/bloc/error_dispatcher.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/home/home_header.dart';
import 'package:kango/screens/messages/messages_bloc.dart';
import 'package:kango/screens/utils/menu_utils.dart';

import 'message_list.dart';
class MessageWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: MenuUtils(),
      key: scaffoldKey,
      body: Column(
        children: [
          Column(
            children: [
              HomeHeader(
                onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          ),
          Expanded(child: MessagesScreen())
        ],
      ),
    );
  }
}





class MessagesScreen extends BaseScreen {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends BaseState<MessagesScreen, MessagesBloc>
    with ErrorDispatcher {
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
            padding: const EdgeInsets.only(bottom: 0, top: 25, left: 20),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              children: [
                Image.asset('asset/vektor_23.png'),
                const SizedBox(
                  width: 18,
                ),
                Text(S.of(context).bildirilrim,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
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
        StreamBuilder<List<Message>>(
            stream: bloc.paginableList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SliverToBoxAdapter();
              }
              if (snapshot.data!.isEmpty) {
                //TODO
                return const SliverToBoxAdapter(
                    child: Center(
                        child: Text(
                  'You don order',
                )));
              }
              return MessageList(
                data: snapshot.data!,
              );
            })
      ],
    );
  }

  @override
  MessagesBloc provideBloc() {
    return MessagesBloc();
  }
}
