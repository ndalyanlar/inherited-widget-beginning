import 'package:flutter/material.dart';

import '../base/server.dart';
import '../main.dart';
import '../widget/cart_icon.dart';
import '../widget/product_list.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _inSearch = false;

  void _toogleSearch(BuildContext context) {
    setState(() {
      _inSearch = !_inSearch;
    });
    AppStateWidget.of(context).setProductList(Server.getProductList());
    _controller.clear();
    // productListKey.currentState!.productList = Server.getProductList();
  }

  void _handleSearch(BuildContext context) {
    // _focusNode.unfocus();
    final String filter = _controller.text;
    // productListKey.currentState!.productList =
    //     Server.getProductList(filter: filter);
    AppStateWidget.of(context)
        .setProductList(Server.getProductList(filter: filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/2592/2592226.png",
                fit: BoxFit.cover,
              ),
            ),
            title: _inSearch
                ? TextField(
                    onChanged: (value) => _handleSearch(context),
                    autofocus: false,
                    focusNode: _focusNode,
                    controller: _controller,
                    onSubmitted: (value) => _handleSearch(context),
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: IconButton(
                        onPressed: () => _handleSearch(context),
                        icon: const Icon(Icons.search),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _toogleSearch(context),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ),
                  )
                : null,
            actions: [
              if (!_inSearch)
                IconButton(
                  onPressed: () => _toogleSearch(context),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ShoppingCartIcon(
                  // key: shoppingCartKey,
                  ),
            ],
            backgroundColor: Colors.white,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ProductList(
                // key: productListKey,
                ),
          )
        ],
      ),
    );
  }
}
