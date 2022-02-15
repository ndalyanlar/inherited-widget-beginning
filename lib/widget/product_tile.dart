import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.purchased,
    required this.onAddToCart,
    required this.onRemoveFromCart,
  }) : super(key: key);

  final Product product;
  final bool purchased;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  Color getButtonColor(Set<MaterialState> states) {
    return purchased ? Colors.grey : Colors.black;
  }

  BorderSide getButtonSide(Set<MaterialState> states) {
    return BorderSide(
      color: purchased ? Colors.grey : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        color: const Color(0xfff8f8f8),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: VerticalDirection.up,
          runSpacing: 0,
          spacing: 0,
          alignment: WrapAlignment.spaceAround,
          children: [
            _buildTitleText(context),
            _buildDescText(),
            _buildPurchButton(),
            _buildImage(),
          ],
        ));
  }

  Image _buildImage() {
    return Image.asset(
      product.pictureUrl!,
    );
  }

  Padding _buildPurchButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: OutlinedButton(
        child: purchased
            ? const Text('Remove from cart')
            : const Text('Add to cart'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getButtonColor),
          side: MaterialStateProperty.resolveWith(getButtonSide),
        ),
        onPressed: purchased ? onRemoveFromCart : onAddToCart,
      ),
    );
  }

  Text _buildDescText() {
    return Text.rich(
      product.desc!,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding _buildTitleText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FittedBox(
        child: Text(
          product.title!,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
