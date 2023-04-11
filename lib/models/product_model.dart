class Product {
  int id;
  String name;
  int quantity;
  String image;
  int price;
  bool isLiked = false;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
    required this.isLiked,
  });
}
