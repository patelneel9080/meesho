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
        _tabController.addListener(() {
          if (_tabController.indexIsChanging) {
            setState(() {
              _selectedCategory = ['All', 'Women', 'Men', 'Electronics'][_tabController.index];
            });
          }
        });
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
              height: size.height * 1.5,
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
                        child: TabBar(dividerColor: Colors.transparent,
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
                        ProductGrid(products: _filterProductsByCategory('All')),
                        ProductGrid(products: _filterProductsByCategory('Women')),
                        ProductGrid(products: _filterProductsByCategory('Men')),
                        ProductGrid(products: _filterProductsByCategory('Electronics')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      List<Product> _filterProductsByCategory(String category) {
        List<Product> filteredProducts;
        if (category == 'All') {
          filteredProducts = pro;
        } else {
          filteredProducts = pro.where((product) => product.category == category).toList();
        }

        if (_searchQuery.isNotEmpty) {
          filteredProducts = filteredProducts.where((product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
        }

        return filteredProducts;
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
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute(product));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height / 4.5,
                width: size.width / 2.3,
                decoration: BoxDecoration(
                  color: Colors.white,
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
          ),
        );
      }

      Route _createRoute(Product product) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ProductDetailPage(product: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      }
    }

    class ProductDetailPage extends StatelessWidget {
      final Product product;

      ProductDetailPage({required this.product});

      @override
      Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink.shade100, Colors.pink.shade200],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                         bottom: 1,left: 60,right: 60,
                        child: Image.asset(
                          product.imageUrl,
                          height: size.height * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: IconButton(
                          icon: Icon(Icons.favorite_outline, color: Colors.white),
                          onPressed: () {
                            // Add to cart functionality
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Classic', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                            Spacer(),
                            SizedBox(width: 8),
                          Text('₹${product.price}', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.84))),
                        ],
                      ),
                       SizedBox(height: 16),
                      Text('Color', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) => _buildColorOption(context, product.imageUrl)),
                      ),
                      SizedBox(height: 16),
                      Text('Select Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: ['38', '40', '42', '44', '46']
                            .map((size) => _buildSizeOption(context, size))
                            .toList(),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Buy now functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('Buy Now', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      Widget _buildColorOption(BuildContext context, String imageUrl) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        );
      }

      Widget _buildSizeOption(BuildContext context, String size) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(size, style: TextStyle(fontSize: 16)),
        );
      }
    }
