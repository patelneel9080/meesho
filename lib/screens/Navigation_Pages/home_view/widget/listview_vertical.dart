import 'package:caferia/screens/Navigation_Pages/add_to_cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../cart_provider.dart';
import '../../../../const.dart';
import '../../../../model/coffee_model.dart';

class ListViewVerticalWidget extends StatelessWidget {

  const ListViewVerticalWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SizedBox(
      height: size.height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(12),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            width: size.width / 4,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 1.5)
            ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffFFECD2),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(cof[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cof[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("\$" "${cof[index].price}"),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    final cartItem = Coffee(image: cof[index].image, name: cof[index].name, price: cof[index].price);
                    cartProvider.addToCart(cartItem);
                    },
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Card(
                      color: Color(0xffE65836),
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 12,
                ),
              ],
            ),
          );
        },
        itemCount: cof.length,
      ),
    );
  }
}