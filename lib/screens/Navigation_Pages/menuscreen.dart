import 'package:caferia/screens/Navigation_Pages/favourite_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> _favorites = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height / 3.6),
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height / 3.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/Images/apptheme.webp"),
                  fit: BoxFit.cover,
                  opacity: .4,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      color: Color(0xffFFF2E1),
                      fontSize: 43,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 28,
              child: SizedBox(
                width: size.width / 1.15,
                child: const SearchBar(
                  hintText: "Search",
                  trailing: [
                    CircleAvatar(
                      backgroundColor: Color(0xffE65836),
                      child: Icon(Icons.search_rounded, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MenuItemWidget(
              title: "Espresso",
              price: "\$2.99",
              imageUrl: "assets/Images/coffee.png",
              rating: 4.5,
              description: "Strong and bold espresso.",
              isBestSeller: true,
              onTap: () => _showDetails(context, "Espresso", "Strong and bold espresso, perfect for a quick caffeine boost.", "assets/Images/coffee.png"),
              onFavorite: () => _toggleFavorite("Espresso", "Strong and bold espresso.", "assets/Images/espresso.jpg"),
            ),
            MenuItemWidget(
              title: "Cappuccino",
              price: "\$3.99",
              imageUrl: "assets/Images/coffee.png",
              rating: 4.7,
              description: "Creamy and rich cappuccino.",
              isNew: true,
              onTap: () => _showDetails(context, "Cappuccino", "Creamy and rich cappuccino with a perfect blend of milk and espresso.", "assets/Images/coffee.png"),
              onFavorite: () => _toggleFavorite("Cappuccino", "Creamy and rich cappuccino.", "assets/Images/cappuccino.jpg"),
            ),
            MenuItemWidget(
              title: "Latte",
              price: "\$4.49",
              imageUrl: "assets/Images/coffee.png",
              rating: 4.8,
              description: "Smooth and velvety latte.",
              onTap: () => _showDetails(context, "Latte", "Smooth and velvety latte, a favorite choice for a relaxing coffee experience.", "assets/Images/coffee.png"),
              onFavorite: () => _toggleFavorite("Latte", "Smooth and velvety latte.", "assets/Images/latte.jpg"),
            ),
            MenuItemWidget(
              title: "Mocha",
              price: "\$4.99",
              imageUrl: "assets/Images/coffee.png",
              rating: 4.6,
              description: "Chocolatey and delightful mocha.",
              onTap: () => _showDetails(context, "Mocha", "Chocolatey and delightful mocha, a perfect mix of coffee and chocolate.", "assets/Images/coffee.png"),
              onFavorite: () => _toggleFavorite("Mocha", "Chocolatey and delightful mocha.", "assets/Images/mocha.jpg"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavouriteScreen(favorites: _favorites),
            ),
          );
        },
        child: Icon(Icons.favorite),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _showDetails(BuildContext context, String title, String description, String imageUrl) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5  ),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add_shopping_cart,color: Colors.white,),
                      label: Text("Add to Cart",style: TextStyle(color: Colors.white,),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE65836),
                          fixedSize: Size(size.width / 2.3  , size.height / 18)
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border,color: Colors.white,),
                      label: Text("Add to Fav",style: TextStyle(color: Colors.white,),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        fixedSize: Size(size.width /2.3, size.height / 18)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleFavorite(String title, String description, String imageUrl) {
    setState(() {
      final existingIndex = _favorites.indexWhere((item) => item['title'] == title);
      if (existingIndex >= 0) {
        _favorites.removeAt(existingIndex);
      } else {
        _favorites.add({
          'title': title,
          'description': description,
          'imageUrl': imageUrl,
        });
      }
    });
  }
}

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final double rating;
  final String description;
  final bool isBestSeller;
  final bool isNew;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const MenuItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.onTap,
    required this.onFavorite,
    this.isBestSeller = false,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      if (isBestSeller)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Chip(
                            label: Text("Best Seller"),
                            backgroundColor: Colors.orange,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      if (isNew)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Chip(
                            label: Text("New"),
                            backgroundColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.red),
                onPressed: onFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
