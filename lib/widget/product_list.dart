import 'package:flutter/material.dart';

import '../base/server.dart';
import '../main.dart';
import 'product_tile.dart';

// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   State<ProductList> createState() => ProductListState();
// }

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  // List<String> _prodList = Server.getProductList();
  // List<String> get prodList => _prodList;

  // set productList(List<String> list) {
  //   setState(() {
  //     _prodList = list;
  //   });
  // }

  // Set<String> _itemsInCard = <String>{};
  // Set<String> get itemsInCard => _itemsInCard;

  // set itemInCard(Set<String> icc) {
  //   setState(() {
  //     _itemsInCard = icc;
  //   });
  // }

  // void _handleAddToCard(String id) {
  //   _itemsInCard.add(id);
  //   itemInCard = _itemsInCard;
  //   shoppingCartKey.currentState!.itemsInCart = itemsInCard;
  // }

  void _handleAddToCard(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  // void _handleRemoveFromCart(String id) {
  //   itemInCard = _itemsInCard..remove(id);
  //   shoppingCartKey.currentState!.itemsInCart = itemsInCard;
  // }

  void _handleRemoveFromCard(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  ProductTile _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: AppStateScope.of(context).itemsInCard.contains(id),
      onAddToCart: () => _handleAddToCard(id, context),
      onRemoveFromCart: () => _handleRemoveFromCard(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> prodList = AppStateScope.of(context).productList;
    return Column(
        children:
            prodList.map((id) => _buildProductTile(id, context)).toList());
  }
}
