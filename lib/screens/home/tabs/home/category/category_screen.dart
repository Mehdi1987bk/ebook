import 'package:flutter/material.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  final double? margin;

  const CategoryItem({Key? key, required this.category, required this.onTap, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all( 8),
        padding:  EdgeInsets.all(margin ?? 8),
        decoration: BoxDecoration(
            color: AppColors.appColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          category.name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
