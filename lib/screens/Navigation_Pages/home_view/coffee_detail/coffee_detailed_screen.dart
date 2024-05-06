import 'package:caferia/screens/Navigation_Pages/add_to_cart/cart_screen.dart';
import 'package:caferia/screens/Navigation_Pages/add_to_cart/choose_cafe.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/coffee_detail/widget/customization_item.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/coffee_detail/widget/sizeitem.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../cart_provider.dart';
import '../../../../model/coffee_model.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetailsScreen({required this.coffee});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  String _selectedSize = '';
  String _customization = '';
  String? _selectedVariety;
  String? _selectedWhippedCream;


  Future<void> _loadSelectedVariety() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedVariety = prefs.getString('selectedVariety') ?? '';
    });
  }

  Future<void> _saveSelectedVariety(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedVariety', value);
  }

  void _selectVariety(String? variety) {
    setState(() {
      _selectedVariety = variety;
      _saveSelectedVariety(variety!);
    });
  }

  void _selectCustomization(String option) {
    setState(() {
      _customization = option;
    });
  }

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  Future<void> _loadSelectedWhippedCream() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedWhippedCream = prefs.getString('selectedWhippedCream') ?? '';
    });
  }

  Future<void> _saveSelectedWhippedCream(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedWhippedCream', value);
  }

  void _selectWhippedCream(String? option) {
    setState(() {
      _selectedWhippedCream = option;
      _saveSelectedWhippedCream(option!);
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Container(
          height: size.height,
          child: Column(children: [
            Text(
              "Milk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text("Pick one"),
            ListView(
              shrinkWrap: true,
              children: [
                cutomRadioListTile(_selectedVariety!, _selectVariety),
                cutomRadioListTile(_selectedVariety!, _selectVariety),
                cutomRadioListTile(_selectedVariety!, _selectVariety),
                cutomRadioListTile(_selectedVariety!, _selectVariety),
                cutomRadioListTile(_selectedVariety!, _selectVariety),
                RadioListTile<String>(
                  title: Text('Soy Milk'),
                  value: 'Soy Milk',
                  groupValue: _selectedVariety,
                  contentPadding: EdgeInsets.zero,
                  onChanged: _selectVariety,
                  activeColor: Color(0xffE65836),
                ),
                RadioListTile<String>(
                  title: Text('Skim Milk'),
                  value: 'Skim Milk',
                  groupValue: _selectedVariety,
                  contentPadding: EdgeInsets.zero,
                  onChanged: _selectVariety,
                  activeColor: Color(0xffE65836),
                ),
                RadioListTile<String>(
                  title: Text('Almond Milk'),
                  value: 'Almond Milk',
                  groupValue: _selectedVariety,
                  onChanged: _selectVariety,
                  contentPadding: EdgeInsets.zero,
                  activeColor: Color(0xffE65836),
                ),
                RadioListTile<String>(
                  title: Text('Cow Milk'),
                  value: 'Cow Milk',
                  groupValue: _selectedVariety,
                  onChanged: _selectVariety,
                  contentPadding: EdgeInsets.zero,
                  activeColor: Color(0xffE65836),
                ),
              ],
            ),
            Text(
              "Whipped Cream",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                RadioListTile<String>(
                  title: Text('Without Whipped Cream'),
                  value: 'Without Whipped Cream',
                  groupValue: _selectedWhippedCream,
                  onChanged: _selectWhippedCream,
                  activeColor: Color(0xffE65836),
                ),
                RadioListTile<String>(
                  title: Text('With Whipped Cream (\$0.5 extra)'),
                  value: 'With Whipped Cream',
                  groupValue: _selectedWhippedCream,
                  onChanged: _selectWhippedCream,
                  activeColor: Color(0xffE65836),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }

  void initState() {
    super.initState();
    _loadSelectedVariety();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 2.8),
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage("assets/Images/apptheme.webp"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.dstATop))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100, left: 100, right: 100),
                child: Container(
                  height: size.height / 4,
                  width: size.width / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.coffee.image),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top,
                child: IconButton(
                  icon: Icon(
                      Icons.arrow_back, color: Colors.white, size: 25),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Color(0xffE65836),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _animation.value * MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffee.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Espresso is a concentrated form of coffee served in small, strong shots and is the base for many coffee drinks. It's made from the same beans as coffee but is stronger, thicker, and higher in caffeine. However, because espresso is typically served in smaller servings than coffee, it has less caffeine per serving.",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(height: 16),
                    const Text(
                      "Size",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizeItem(
                          sizecof: 'Small',
                          isSelected: _selectedSize == 'Small',
                          onTap: _selectSize,
                        ),
                        Spacer(),
                        SizeItem(
                          sizecof: 'Medium',
                          isSelected: _selectedSize == 'Medium',
                          onTap: _selectSize,
                        ),
                        Spacer(),
                        SizeItem(
                          sizecof: 'Large',
                          isSelected: _selectedSize == 'Large',
                          onTap: _selectSize,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    const Text(
                      "Customize your coffee",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomizationItem(
                          option: 'Milk',
                          icon: Icons.local_cafe,
                          isSelected: _customization == 'Milk',
                          onTap: _selectCustomization,
                        ),
                        SizedBox(width: 8),
                        CustomizationItem(
                          option: 'Cream',
                          icon: Icons.local_cafe,
                          isSelected: _customization == 'Cream',
                          onTap: _selectCustomization,
                        ),
                        SizedBox(width: 8),
                        CustomizationItem(
                          option: 'Beans',
                          icon: Icons.local_cafe,
                          isSelected: _customization == 'Coffee Beans',
                          onTap: _selectCustomization,
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Color(0xffE65836),
                            child: Icon(
                              CupertinoIcons.pencil,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Price"),
                            Text(
                              "\$${widget.coffee.price}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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
                            final cartProvider = Provider.of<CartProvider>(context, listen: false);
                            cartProvider.addToCart(widget.coffee);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Item added to cart'),
                                duration: Duration(seconds: 2), // Adjust the duration as needed
                              ),
                            );
                            // No need to navigate to CartScreen here
                          },
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

Widget cutomRadioListTile(String groupValue, Function(String?)? onChange) {
  return Container(
    height: 30,
    margin: EdgeInsets.zero,
    child: RadioListTile<String>(
      title: Text('Full Milk'),
      value: 'Full Milk',
      groupValue: groupValue,
      contentPadding: EdgeInsets.zero,
      onChanged: onChange,
      activeColor: Color(0xffE65836),
    ),
  );
}
