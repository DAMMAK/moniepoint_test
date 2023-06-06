class Product {
  final String name;
  final String imgUrl;
  final double rating;
  final int salesCount;
  final double price;
  final String category;
  final bool isLiked;

  Product({
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.category,
    required this.rating,
    required this.salesCount,
    this.isLiked = false,
  });
}

var products = [
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 12.00,
    imgUrl: "assets/images/product1.png",
    category: "Shrit",
    rating: 4.9,
    salesCount: 2356,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 18.00,
    imgUrl: "assets/images/product2.png",
    category: "Shrit",
    rating: 4.5,
    isLiked: true,
    salesCount: 2564,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 32.00,
    imgUrl: "assets/images/product3.png",
    category: "Shrit",
    rating: 4.2,
    salesCount: 7895,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 22.00,
    imgUrl: "assets/images/product4.png",
    category: "Shrit",
    rating: 4.3,
    salesCount: 2356,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 12.00,
    imgUrl: "assets/images/product5.png",
    category: "Shrit",
    rating: 4.9,
    salesCount: 2356,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 12.00,
    imgUrl: "assets/images/product1.png",
    category: "Shrit",
    rating: 4.9,
    salesCount: 2356,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 18.00,
    imgUrl: "assets/images/product2.png",
    category: "Shrit",
    rating: 4.5,
    salesCount: 2564,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 32.00,
    imgUrl: "assets/images/product3.png",
    category: "Shrit",
    rating: 4.2,
    salesCount: 7895,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 22.00,
    imgUrl: "assets/images/product4.png",
    category: "Shrit",
    rating: 4.3,
    salesCount: 2356,
  ),
  Product(
    name: 'Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
    price: 12.00,
    imgUrl: "assets/images/product5.png",
    category: "Shrit",
    rating: 4.9,
    salesCount: 2356,
  )
];
