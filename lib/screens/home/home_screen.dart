import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/screens/home/tabs/home/home_tab_screen.dart';
import 'package:kango/screens/home/tabs/saved_books/saved_books_screen.dart';
import 'package:kango/screens/home/tabs/setting/setting_screen.dart';
import 'package:kango/screens/home/tabs/user_details/user_details_screen.dart';

import '../../domain/entities/book.dart';
import '../../domain/entities/pagination.dart';
import '../add_book/add_book_screen.dart';
import 'bottom_bar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> notifier = ValueNotifier(0);
  final ValueNotifier<bool> optionsNotifier = ValueNotifier(false);
  final Future<List<Book>?> authorBooks =
      sl.get<AuthRepository>().getAuthorBooks();

  @override
  void dispose() {
    optionsNotifier.dispose();
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: _Tabs(
                notifier: notifier,
              ))
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                authorBooks: authorBooks,
                onChanged: (index) {
                  if (index == 5) {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return AddBookScreen();
                    }));
                  }else{
                    notifier.value = index;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatefulWidget {
  final ValueNotifier<int> notifier;

  _Tabs({Key? key, required this.notifier}) : super(key: key);

  @override
  __TabsState createState() => __TabsState();
}

class __TabsState extends State<_Tabs> {
  late List<Widget> _tabs;
  final Future<List<Book>?> authorBooks =
      sl.get<AuthRepository>().getAuthorBooks();

  @override
  void initState() {
    super.initState();
    _tabs = <Widget>[
      HomeTab(),
      SavedBooksScreen(),
      UserDetailsScreen(
        authorBooks: authorBooks,
      ),
      SettingScreen(authorBooks),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: widget.notifier,
        builder: (BuildContext context, value, Widget? child) {
          return IndexedStack(
            index: value,
            children: _tabs,
          );
        });
  }
}
