class ProductModel {
  String imageUrl;
  double price;
  String name;
  String quantity;
  String description;
  String tag;

  ProductModel(
      {required this.name,
      required this.price,
      required this.tag,
      required this.description,
      required this.imageUrl,
      required this.quantity});

  String get tagValue => tag;
  // set tagValue(String str) => tag = str;
}
