import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  List<Product> _filterProducts() {
    List<Product> filteredProducts;
    if (_selectedCategory == 'All') {
      filteredProducts = pro;
    } else {
      filteredProducts = pro
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filteredProducts;
  }

  void _showCategoryFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCategoryOption('All'),
              _buildCategoryOption('Women'),
              _buildCategoryOption('Men'),
              _buildCategoryOption('Electronics'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryOption(String category) {
    return ListTile(
      title: Text(category),
      trailing: _selectedCategory == category
          ? Icon(Icons.check, color: Color(0xffF599A4))
          : null,
      onTap: () {
        setState(() {
          _selectedCategory = category;
          _tabController.animateTo(
              ['All', 'Women', 'Men', 'Electronics'].indexOf(category));
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final filteredProducts = _filterProducts();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffF599A4),
            child: Icon(
              CupertinoIcons.money_dollar_circle,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/Images/user.png"),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "meesho",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Color(0xff570D48),
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 3,
          child: Column(
            children: [

              SizedBox(height: size.height / 54),
              Row(
                children: [
                  Container(
                    height: size.height / 16,
                    width: size.width / 1.44,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 12),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Colors.black54,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _showCategoryFilterDialog,
                    child: Container(
                      height: size.height / 16,
                      width: size.width / 8,
                      decoration: BoxDecoration(
                        color: Color(0xffF599A4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height / 54),
              if (_searchQuery.isEmpty) ...[
                CarouselSlider(
                  items: [
                    Image.asset("assets/Images/carousel_image.png"),
                    Image.asset("assets/Images/carousel_image.png"),
                    Image.asset("assets/Images/carousel_image.png"),
                  ],
                  options: CarouselOptions(
                    animateToClosest: true,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    height: size.height / 5.5,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                  ),
                ),
                SizedBox(height: size.height / 44),
                PreferredSize(
                  preferredSize: Size.fromHeight(48.0),
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelStyle: TextStyle(color: Colors.white),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffF599A4),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: _selectedCategory == 'All'
                                  ? Color(0xff570D48)
                                  : Color(0xff570D48),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Women",
                            style: TextStyle(
                              color: _selectedCategory == 'Women'
                                  ? Color(0xff570D48)
                                  : Color(0xff570D48),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Men",
                            style: TextStyle(
                              color: _selectedCategory == 'Men'
                                  ? Color(0xff570D48)
                                  : Color(0xff570D48),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Electronics",
                            style: TextStyle(
                              color: _selectedCategory == 'Electronics'
                                  ? Color(0xff570D48)
                                  : Color(0xff570D48),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductGrid(products: _filterProducts()),
                    ProductGrid(products: _filterProducts()),
                    ProductGrid(products: _filterProducts()),
                    ProductGrid(products: _filterProducts()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height / 4.5,
          width: size.width / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.black54, blurRadius: 4),
            ],
            image: DecorationImage(
              image: AssetImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Text(
          '₹${product.price.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ],
    );
  }
}
