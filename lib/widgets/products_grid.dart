import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/products_provider.dart';
import 'package:my_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductstGrid extends StatelessWidget {
  final bool showFavs;

  const ProductstGrid({Key key, this.showFavs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodcutsData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? prodcutsData.favoriteitems : prodcutsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
    );
  }
}
