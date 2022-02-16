import 'package:flutter/material.dart';
import 'package:inherited_widget_beginning/model/app_state.dart';
import 'base/server.dart';
import 'screen/store_page.dart';

// final GlobalKey<ShoppingCartIconState> shoppingCartKey =
//     GlobalKey<ShoppingCartIconState>();
// final GlobalKey<ProductListState> productListKey =
//     GlobalKey<ProductListState>();
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final String title = "Store";

  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: const StorePage(),
      ),
    );
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope(this.data, {Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;
  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(
    productList: Server.getProductList(),
  );

  void setProductList(List<String> newProductList) {
    if (newProductList != _data.productList) {
      setState(() {
        _data = _data.copyWith(
          productList: newProductList,
        );
      });
    }
    return;
  }

  void addToCart(String id) {
    if (!_data.itemsInCard.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCard);

      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCard: newItemsInCart,
        );
      });
    }
    return;
  }

  void removeFromCart(String id) {
    if (_data.itemsInCard.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCard);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCard: newItemsInCart,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}
