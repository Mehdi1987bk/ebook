import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/screens/home/tabs/home/category/category_screen.dart';

import '../../../../../data/network/response/category.dart';
import '../../../../../generated/l10n.dart';
import '../../../../sub_category/sub_category_screen.dart';

class CategoryNewPage extends StatefulWidget {
  final List<Category> category;

  const CategoryNewPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewPageState createState() => _CategoryNewPageState();
}

class _CategoryNewPageState extends State<CategoryNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Text(
              S.of(context).kateqoriyalar,
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.category.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final category = widget.category[index];
                return CategoryItem(
                  margin: 16,
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return SubCategoryScreen(
                        category: category,
                      );
                    }));
                  },
                  category: category,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
