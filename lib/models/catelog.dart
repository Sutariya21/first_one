class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}

final products = [Item(
  id: "code1",
  name: "iphone 12 pro",
  desc: "Apple iphone 12th  generation",
  price: 12000,
  color: "#33505a",
  image: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=16040216630000"
)];
