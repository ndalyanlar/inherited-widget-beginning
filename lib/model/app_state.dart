class AppState {
  final List<String> productList;
  final Set<String> itemsInCard;

  AppState({required this.productList, this.itemsInCard = const <String>{}});

  AppState copyWith({List<String>? productList, Set<String>? itemsInCard}) {
    return AppState(
        productList: productList ?? this.productList,
        itemsInCard: itemsInCard ?? this.itemsInCard);
  }
}
