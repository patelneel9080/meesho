class Coffee {
  final String image;
  final String name;
  final double price;
  int quantity;

  Coffee({
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

List<Coffee> cof = [
  Coffee(
    image: 'assets/Images/coffee_cup_bkg.png',
    name: 'Espresso',
    price: 2.99,
  ),
  Coffee(
    image: 'assets/Images/coffee_cup_bkg.png',
    name: 'Latte',
    price: 3.99,),
  Coffee(
    image: 'assets/Images/coffee_cup_bkg.png',
    name: 'Latte',
    price: 3.99,),
  Coffee(
    image: 'assets/Images/coffee_cup_bkg.png',
    name: 'Latte',
    price: 3.99,),
  Coffee(
    image: 'assets/Images/coffee_cup_bkg.png',
    name: 'Latte',
    price: 3.99,),
];
