import 'package:flutter/material.dart';
import '../../../../model/coffee_model.dart';
import '../coffee_detailed_screen.dart';

class ListViewCardWidget extends StatelessWidget {
  const ListViewCardWidget({
    Key? key,
    required this.size,
    required this.coffees,
  }) : super(key: key);

  final Size size;
  final List<Coffee> coffees;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final coffee = coffees[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the details screen when a container is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoffeeDetailsScreen(coffee: coffee),
                ),
              );
            },
            child: Container(
              width: size.width / 4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 1.5),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffFFECD2),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(coffee.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(coffee.name),
                  Text("${coffee.price}"),
                ],
              ),
            ),
          );
        },
        itemCount: coffees.length,
      ),
    );
  }
}
