import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>>? favorites;
  const FavouriteScreen({Key? key, this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height / 3.8),
        child: Container(
          width: size.width,
          height: size.height / 4.5,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: size.width / 14),
              Text(
                "Favourites",
                style: TextStyle(
                  color: Color(0xffFFF2E1),
                  fontSize: 43,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favorites != null && favorites!.isNotEmpty
            ? ListView.builder(
          itemCount: favorites!.length,
          itemBuilder: (context, index) {
            final item = favorites![index];
            return Card(
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
                        item['assets/Images/coffee.png'] ?? 'assets/Images/coffee.png', // Null check and fallback image
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item['title'] ?? '', // Null check
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      item['description'] ?? '', // Null check
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            );
          },
        )
            : Center(
          child: Text(
            'No favorites yet.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
