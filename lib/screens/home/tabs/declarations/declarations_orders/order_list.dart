import 'package:flutter/material.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/screens/home/tabs/declarations/declarations_orders/declaration_item.dart';

const productItemHeight = 290.0;
const bigProductItemHeight = 350.0;

class ProductList extends StatelessWidget {
  final List<Declaration> data;

  const ProductList(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return DeclarationItem(declaration: data[index]);
    }, childCount: data.length));
  }
}
