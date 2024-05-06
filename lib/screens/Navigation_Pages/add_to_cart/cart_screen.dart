import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<bool> _isSelected;
  bool _isSelectMode = false;

  @override
  void initState() {
    super.initState();
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    _isSelected = List<bool>.generate(cartProvider.cartItems.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final total = cartItems.fold<double>(
        0, (previousValue, cartItem) => previousValue + cartItem.price * cartItem.quantity);
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
              SizedBox(
                width: size.width / 14,
              ),
              Text(
                "My Cart",
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
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 18.8,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  "Cart Items:-",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSelectMode = !_isSelectMode;
                    });
                  },
                  icon: Icon(_isSelectMode ? Icons.cancel : Icons.select_all),
                ),
                IconButton(
                  onPressed: () {
                    // Delete selected items
                    for (int i = _isSelected.length - 1; i >= 0; i--) {
                      if (_isSelected[i]) {
                        cartProvider.removeCartItem(cartItems[i]);
                        _isSelected.removeAt(i);
                      }
                    }
                    setState(() {
                      _isSelectMode = false;
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final coffee = cartItems[index];
                return Container(
                  width: size.width / 4,
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 1.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_isSelectMode)
                        Checkbox(
                          value: _isSelected[index],
                          onChanged: (value) {
                            setState(() {
                              _isSelected[index] = value!;
                            });
                          },
                        ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffFFECD2),
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(coffee.image),
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
                            coffee.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("\$" "${coffee.price}"),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: Color(0xffE65836),
                            child: IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: () {
                                if (coffee.quantity > 1) {
                                  coffee.quantity--;
                                  cartProvider.updateCart(); // Notify listeners of change
                                }
                              },
                            ),
                          ),
                          Text(
                            coffee.quantity.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: Color(0xffE65836),
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                coffee.quantity++;
                                cartProvider.updateCart(); // Notify listeners of change
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width / 12,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.black54,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Price :-"),
                  Text(
                    '\$${total.toStringAsFixed(2)}', // Display total price
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff28313E)),
                  fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width / 1.6, MediaQuery.of(context).size.height / 18)),
                ),
                onPressed: () {

                },
                child: Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black54,),
        ],
      ),
    );
  }
}
