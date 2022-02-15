import '../data/fake_data.dart';

import '../model/product.dart';

class Server {
  static Product getProductById(String id) {
    return fakeData[id]!;
  }

  static List<String> getProductList({String? filter}) {
    if (filter == null) return fakeData.keys.toList();

    final List<String> ids = <String>[];
    fakeData.values.toList().forEach((prod) {
      if (prod.title!.toLowerCase().contains(filter.toLowerCase())) {
        ids.add(prod.id!);
      }
    });
    return ids;
  }
}
