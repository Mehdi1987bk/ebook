import 'package:flutter/material.dart';
import 'package:kango/data/network/response/category.dart';

import '../../presentation/resourses/app_colors.dart';

class CategorySelector extends StatefulWidget {
  final List<Category> categories;
  final ValueChanged<List<Category>> onChange;

  const CategorySelector(
      {Key? key, required this.categories, required this.onChange})
      : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final _selectedCategory = <Category>[];

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: 50),
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.appColor, width: 1.5),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                children: _selectedCategory
                    .map<Widget>((e) => _MultiSelectionItem(
                          filter: e,
                          onRemove: _onRemove,
                        ))
                    .toList(),
              ),
            ),
            PopupMenuButton<Category>(itemBuilder: (context) {
              return widget.categories
                  .map<PopupMenuItem<Category>>((e) => PopupMenuItem(
                        value: e,
                        child: Text(e.name,style: e.subCategory ? null : TextStyle(fontWeight: FontWeight.w700,color: Colors.red),),
                      ))
                  .toList();
            }, onSelected: (category) {
              setState(() {
                _selectedCategory.add(category);
                widget.onChange(List.from(_selectedCategory));
              });
            }),
          ],
        ));
  }

  _onRemove(Category value) {
    setState(() {
      _selectedCategory.remove(value);
      widget.onChange(List.from(_selectedCategory));
    });
  }
}

class _MultiSelectionItem extends StatelessWidget {
  final Category filter;
  final ValueChanged<Category> onRemove;

  const _MultiSelectionItem(
      {Key? key, required this.filter, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onRemove(filter),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColors.appColor.withOpacity(0.5),
            border: Border.all(color: AppColors.appColor, width: 1.5),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text(filter.name), const Icon(Icons.close)],
        ),
      ),
    );
  }
}
