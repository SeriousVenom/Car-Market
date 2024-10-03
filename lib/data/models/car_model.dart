// Product model
class ProductModel {
  final String name;
  final double price;
  final String imageUrl;
  final bool isNew;
  final int rating;

  ProductModel({required this.name, required this.price, required this.imageUrl, this.isNew = false, this.rating = 0});
}
