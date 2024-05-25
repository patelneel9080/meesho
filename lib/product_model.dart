class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category; // Add category attribute

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}
List<Product> pro = [
  // Women Products
  Product(name: 'Women Dress', price: 499.99, imageUrl: 'assets/Images/women-dress.jpg', category: 'Women'),
  Product(name: 'Women Top', price: 299.99, imageUrl: 'assets/Images/women-top.jpg', category: 'Women'),
  Product(name: 'Women Skirt', price: 399.99, imageUrl: 'assets/Images/women-skirt.jpg', category: 'Women'),
  Product(name: 'Women Jeans', price: 799.99, imageUrl: 'assets/Images/women-jeans.jpg', category: 'Women'),

  // Men Products
  Product(name: 'Men T-shirt', price: 299.99, imageUrl: 'assets/Images/men-tshirt.jpg', category: 'Men'),
  Product(name: 'Men Shirt', price: 499.99, imageUrl: 'assets/Images/men-shirt.jpg', category: 'Men'),
  Product(name: 'Men Jeans', price: 799.99, imageUrl: 'assets/Images/men-jeans.jpg', category: 'Men'),
  Product(name: 'Men Jacket', price: 999.99, imageUrl: 'assets/Images/men-jacket.jpg', category: 'Men'),

  // Electronics Products
  Product(name: 'Laptop', price: 49999.99, imageUrl: 'assets/Images/laptop.jpg', category: 'Electronics'),
  Product(name: 'Smartphone', price: 19999.99, imageUrl: 'assets/Images/smartphone.jpg', category: 'Electronics'),
  Product(name: 'Headphones', price: 2999.99, imageUrl: 'assets/Images/head-phone.jpg', category: 'Electronics'),
  Product(name: 'Smartwatch', price: 9999.99, imageUrl: 'assets/Images/smartwatch.jpg', category: 'Electronics'),

  // All Category (Mix)
  Product(name: 'Backpack', price: 999.99, imageUrl: 'assets/Images/backpack.jpg', category: 'All'),
  Product(name: 'Sunglasses', price: 499.99, imageUrl: 'assets/Images/sunglasses.jpg', category: 'All'),
  Product(name: 'Shoes', price: 1999.99, imageUrl: 'assets/Images/shoes.jpg', category: 'All'),
];
