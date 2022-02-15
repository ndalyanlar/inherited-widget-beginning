import 'package:flutter/material.dart';

import '../base/server.dart';
import '../main.dart';
import 'product_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  List<String> _prodList = Server.getProductList();
  List<String> get prodList => _prodList;

  set productList(List<String> list) {
    setState(() {
      _prodList = list;
    });
  }

  Set<String> _itemsInCard = <String>{};
  Set<String> get itemsInCard => _itemsInCard;

  set itemInCard(Set<String> icc) {
    setState(() {
      _itemsInCard = icc;
    });
  }

  void _handleAddToCard(String id) {
    _itemsInCard.add(id);
    itemInCard = _itemsInCard;
    shoppingCartKey.currentState!.itemsInCart = itemsInCard;
  }

  void _handleRemoveFromCart(String id) {
    itemInCard = _itemsInCard..remove(id);
    shoppingCartKey.currentState!.itemsInCart = itemsInCard;
  }

  ProductTile _buildProductTile(String id) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: itemsInCard.contains(id),
      onAddToCart: () => _handleAddToCard(id),
      onRemoveFromCart: () => _handleRemoveFromCart(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: prodList.map(_buildProductTile).toList());
  }
}
