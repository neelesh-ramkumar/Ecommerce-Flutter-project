import 'package:flutter/material.dart';

void main() {
  runApp(const CartZYApp());
}

class CartZYApp extends StatelessWidget {
  const CartZYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B-Mart',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

// Splash Screen with Animation
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    // Navigate to LoginPage after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'CartZY',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Product List with Categories and Ratings
final List<Map<String, dynamic>> products = [
  {
    "name": "Acer Laptop",
    "price": "₹50,999",
    "desc": "Powerful laptop with 16GB RAM",
    "imageUrl":
        "https://m.media-amazon.com/images/I/61fDHkQ6MqL._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Electronics",
    "rating": 4.5,
    "reviews": [
      {"user": "John Doe", "rating": 5, "comment": "Excellent performance!"},
      {"user": "Jane Smith", "rating": 4, "comment": "Good battery life"},
    ],
  },
  {
    "name": "MSI Thin 15",
    "price": "₹49,999",
    "desc":
        "MSI Thin 15 Intel Core i5 12th Gen 13420H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 2050/144 Hz) Thin 15 B13UCX-1808IN Gaming Laptop  (15.6 Inch, Cosmos Grey, 1.86 Kg)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/312/312/xif0q/computer/t/r/u/-original-imah3acvkdhmxkzq.jpeg?q=70",
    "category": "Electronics",
    "rating": 4.2,
    "reviews": [
      {"user": "Gamer123", "rating": 4, "comment": "Great for gaming"},
      {
        "user": "TechEnthusiast",
        "rating": 5,
        "comment": "Lightweight and powerful",
      },
    ],
  },
  {
    "name": "CMF 1",
    "price": "₹16,999",
    "desc": "Feature-rich smartphone with 5G",
    "imageUrl":
        "https://m.media-amazon.com/images/I/71wj5W+olHL._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Electronics",
    "rating": 4.0,
    "reviews": [
      {"user": "MobileUser", "rating": 4, "comment": "Good camera quality"},
    ],
  },
  {
    "name": "Nothing Buds",
    "price": "₹5,999",
    "desc": "Noise-cancelling wireless headphones",
    "imageUrl":
        "https://m.media-amazon.com/images/I/41Fkv2h7i1L._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Accessories",
    "rating": 4.7,
    "reviews": [
      {"user": "MusicLover", "rating": 5, "comment": "Amazing sound quality"},
      {"user": "Commuter", "rating": 4, "comment": "Comfortable for long use"},
    ],
  },
  {
    "name": "Apple iPhone 16",
    "price": "₹74,999",
    "desc": "Apple iPhone 16 (Black, 128 GB)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/8/w/5/-original-imah4jyfwr3bfjbg.jpeg?q=70",
    "category": "Electronics",
    "rating": 4.8,
    "reviews": [
      {"user": "AppleFan", "rating": 5, "comment": "Best iPhone yet"},
      {
        "user": "TechReviewer",
        "rating": 4,
        "comment": "Great camera improvements",
      },
    ],
  },
  {
    "name": "SAMSUNG Galaxy S25 Ultra",
    "price": "₹1,45,999",
    "desc":
        "SAMSUNG Galaxy S25 Ultra 5G (Titanium Silverblue, 512 GB)  (12 GB RAM)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/1/x/3/-original-imah8pdnxdwzazyy.jpeg?q=70",
    "category": "Electronics",
    "rating": 4.9,
    "reviews": [
      {
        "user": "AndroidUser",
        "rating": 5,
        "comment": "The ultimate Android phone",
      },
    ],
  },
  {
    "name": "POCO X7 Pro 5G",
    "price": "₹22,999",
    "desc": "POCO X7 Pro 5G (Yellow, 256 GB)  (12 GB RAM)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/o/q/y/-original-imah8affczqnzp6s.jpeg?q=70",
    "category": "Electronics",
    "rating": 4.3,
    "reviews": [
      {"user": "BudgetBuyer", "rating": 4, "comment": "Great value for money"},
    ],
  },
  {
    "name": "OnePlus Nord Buds",
    "price": "₹1,999",
    "desc":
        "OnePlus Nord Buds 2r in Ear Earbuds with Dual Mic & AI Crystal Clear Call Bluetooth  (Deep Grey, True Wireless)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/w/t/q/-original-imagr4t8zuq2wzhe.jpeg?q=70",
    "category": "Accessories",
    "rating": 4.1,
    "reviews": [
      {"user": "AudioUser", "rating": 4, "comment": "Good sound for the price"},
    ],
  },
  {
    "name": "boAt Airdopes 131 Pro",
    "price": "₹1,399",
    "desc":
        "boAt Airdopes 131 Pro Buds w/ In Ear Detection, 4 Mics ENx Tech & 40 HRS Playback Bluetooth  (Active Black, True Wireless)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/k/0/b/-original-imah4vcukjkyfgyq.jpeg?q=70",
    "category": "Accessories",
    "rating": 4.0,
    "reviews": [
      {"user": "BoatFan", "rating": 4, "comment": "Comfortable fit"},
    ],
  },
  {
    "name": "Noise Crew",
    "price": "₹1,299",
    "desc":
        "Noise Crew 1.38 Round Display with Bluetooth Calling, Metallic finish, IP68 Rating Smartwatch  (Grey Strap, Regular)",
    "imageUrl":
        "https://rukminim2.flixcart.com/image/612/612/xif0q/smartwatch/w/b/q/-original-imah6s6phr7pjzpy.jpeg?q=70",
    "category": "Accessories",
    "rating": 4.2,
    "reviews": [
      {"user": "FitnessUser", "rating": 4, "comment": "Good fitness tracking"},
      {"user": "WatchLover", "rating": 5, "comment": "Stylish and functional"},
    ],
  },
];

// Dummy User Data
final Map<String, String> dummyUser = {
  "email": "user@gmail.com",
  "password": "user",
};

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (emailController.text == dummyUser["email"] &&
                    passwordController.text == dummyUser["password"]) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileSetupPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid email or password'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Setup Page
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pincode';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save profile and navigate to HomePage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HomePage(
                              userProfile: {
                                "name": _nameController.text,
                                "phone": _phoneController.text,
                                "address": _addressController.text,
                                "pincode": _pincodeController.text,
                                "email": dummyUser["email"]!,
                              },
                            ),
                      ),
                    );
                  }
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page with Tabs
class HomePage extends StatefulWidget {
  final Map<String, String> userProfile;

  const HomePage({super.key, required this.userProfile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> cart = [];
  List<Map<String, dynamic>> orders = [];
  List<Map<String, dynamic>> wishlist = [];
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    filteredProducts = products;
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    setState(() {
      filteredProducts =
          products
              .where(
                (product) =>
                    product["name"]!.toLowerCase().contains(
                      _searchController.text.toLowerCase(),
                    ) &&
                    (selectedCategory == "All" ||
                        product["category"] == selectedCategory),
              )
              .toList();
    });
  }

  void addToCart(Map<String, dynamic> product, int quantity) {
    setState(() {
      cart.add({"product": product, "quantity": quantity});
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product["name"]} added to cart'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  void toggleWishlist(Map<String, dynamic> product) {
    setState(() {
      if (wishlist.any((item) => item["name"] == product["name"])) {
        wishlist.removeWhere((item) => item["name"] == product["name"]);
      } else {
        wishlist.add(product);
      }
    });
  }

  void placeOrder(List<Map<String, dynamic>> cartItems, double totalPrice) {
    setState(() {
      orders.add({
        "items": cartItems,
        "totalPrice": totalPrice,
        "date": DateTime.now(),
      });
      cart.clear();
    });
  }

  void buyNow(Map<String, dynamic> product, int quantity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => BuyNowPage(
              product: product,
              quantity: quantity,
              placeOrder: placeOrder,
              userProfile: widget.userProfile,
              updateProfile: (updatedProfile) {
                setState(() {
                  widget.userProfile.update(
                    "name",
                    (value) => updatedProfile["name"]!,
                  );
                  widget.userProfile.update(
                    "phone",
                    (value) => updatedProfile["phone"]!,
                  );
                  widget.userProfile.update(
                    "address",
                    (value) => updatedProfile["address"]!,
                  );
                  widget.userProfile.update(
                    "pincode",
                    (value) => updatedProfile["pincode"]!,
                  );
                });
              },
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartZY'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cart),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => WishlistPage(
                        wishlist: wishlist,
                        toggleWishlist: toggleWishlist,
                      ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ProfilePage(
                        userProfile: widget.userProfile,
                        updateProfile: (updatedProfile) {
                          setState(() {
                            widget.userProfile.update(
                              "name",
                              (value) => updatedProfile["name"]!,
                            );
                            widget.userProfile.update(
                              "phone",
                              (value) => updatedProfile["phone"]!,
                            );
                            widget.userProfile.update(
                              "address",
                              (value) => updatedProfile["address"]!,
                            );
                            widget.userProfile.update(
                              "pincode",
                              (value) => updatedProfile["pincode"]!,
                            );
                          });
                        },
                      ),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Featured'),
            Tab(text: 'Categories'),
            Tab(text: 'Deals'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Featured Tab
          _buildFeaturedTab(),
          // Categories Tab
          _buildCategoriesTab(),
          // Deals Tab
          _buildDealsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Orders'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderHistoryPage(orders: orders),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildFeaturedTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search products...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                ["All", "Electronics", "Accessories"].map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FilterChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (value) {
                        setState(() {
                          selectedCategory = category;
                          _filterProducts();
                        });
                      },
                    ),
                  );
                }).toList(),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: filteredProducts[index],
                addToCart: addToCart,
                buyNow: buyNow,
                isWishlisted: wishlist.any(
                  (item) => item["name"] == filteredProducts[index]["name"],
                ),
                toggleWishlist: toggleWishlist,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesTab() {
    final categories = ["Electronics", "Accessories"];
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final categoryProducts =
            products.where((p) => p["category"] == category).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProducts.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    width: 150,
                    child: ProductCard(
                      product: categoryProducts[i],
                      addToCart: addToCart,
                      buyNow: buyNow,
                      isWishlisted: wishlist.any(
                        (item) => item["name"] == categoryProducts[i]["name"],
                      ),
                      toggleWishlist: toggleWishlist,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDealsTab() {
    // Sort products by rating to show best deals first
    final deals = List.from(products)
      ..sort((a, b) => b["rating"].compareTo(a["rating"]));

    return ListView.builder(
      itemCount: deals.length,
      itemBuilder: (context, index) {
        return DealCard(
          product: deals[index],
          addToCart: addToCart,
          buyNow: buyNow,
          isWishlisted: wishlist.any(
            (item) => item["name"] == deals[index]["name"],
          ),
          toggleWishlist: toggleWishlist,
        );
      },
    );
  }
}

// Product Card Widget with Wishlist
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;
  final Function(Map<String, dynamic>, int) buyNow;
  final bool isWishlisted;
  final Function(Map<String, dynamic>) toggleWishlist;

  const ProductCard({
    super.key,
    required this.product,
    required this.addToCart,
    required this.buyNow,
    required this.isWishlisted,
    required this.toggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ProductDetailsPage(
                    product: product,
                    addToCart: addToCart,
                    buyNow: buyNow,
                    isWishlisted: isWishlisted,
                    toggleWishlist: toggleWishlist,
                  ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    product["imageUrl"]!,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color: isWishlisted ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => toggleWishlist(product),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        product["price"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        product["rating"].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => addToCart(product, 1),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => buyNow(product, 1),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text("Buy Now"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Deal Card Widget
class DealCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;
  final Function(Map<String, dynamic>, int) buyNow;
  final bool isWishlisted;
  final Function(Map<String, dynamic>) toggleWishlist;

  const DealCard({
    super.key,
    required this.product,
    required this.addToCart,
    required this.buyNow,
    required this.isWishlisted,
    required this.toggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ProductDetailsPage(
                    product: product,
                    addToCart: addToCart,
                    buyNow: buyNow,
                    isWishlisted: isWishlisted,
                    toggleWishlist: toggleWishlist,
                  ),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
              child: Image.network(
                product["imageUrl"]!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product["name"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isWishlisted
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isWishlisted ? Colors.red : Colors.grey,
                          ),
                          onPressed: () => toggleWishlist(product),
                        ),
                      ],
                    ),
                    Text(
                      product["price"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          product["rating"].toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => addToCart(product, 1),
                          child: const Text("Add to Cart"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Details Page with Reviews
class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;
  final Function(Map<String, dynamic>, int) buyNow;
  final bool isWishlisted;
  final Function(Map<String, dynamic>) toggleWishlist;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.addToCart,
    required this.buyNow,
    required this.isWishlisted,
    required this.toggleWishlist,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  final TextEditingController _reviewController = TextEditingController();
  int _userRating = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product["name"]!),
          actions: [
            IconButton(
              icon: Icon(
                widget.isWishlisted ? Icons.favorite : Icons.favorite_border,
                color: widget.isWishlisted ? Colors.red : Colors.white,
              ),
              onPressed: () {
                widget.toggleWishlist(widget.product);
                setState(() {});
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.product["imageUrl"]!,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product["name"]!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text(
                                widget.product["rating"].toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.product["price"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.product["desc"]!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text("Quantity: "),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const TabBar(
                            tabs: [Tab(text: 'Details'), Tab(text: 'Reviews')],
                          ),
                          SizedBox(
                            height: 300,
                            child: TabBarView(
                              children: [
                                // Details Tab
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Product Details",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(widget.product["desc"]!),
                                    ],
                                  ),
                                ),
                                // Reviews Tab
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount:
                                              widget.product["reviews"].length,
                                          itemBuilder: (context, index) {
                                            final review =
                                                widget
                                                    .product["reviews"][index];
                                            return Card(
                                              margin: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      review["user"],
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: List.generate(
                                                        5,
                                                        (i) => Icon(
                                                          Icons.star,
                                                          color:
                                                              i < review["rating"]
                                                                  ? Colors.amber
                                                                  : Colors.grey,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(review["comment"]),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Divider(),
                                      const Text("Add Your Review"),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => IconButton(
                                            icon: Icon(
                                              Icons.star,
                                              color:
                                                  index < _userRating
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _userRating = index + 1;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        controller: _reviewController,
                                        decoration: const InputDecoration(
                                          hintText: "Write your review...",
                                          border: OutlineInputBorder(),
                                        ),
                                        maxLines: 2,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_userRating > 0 &&
                                              _reviewController
                                                  .text
                                                  .isNotEmpty) {
                                            setState(() {
                                              widget.product["reviews"].add({
                                                "user": "You",
                                                "rating": _userRating,
                                                "comment":
                                                    _reviewController.text,
                                              });
                                              // Update average rating
                                              final totalRatings = widget
                                                  .product["reviews"]
                                                  .fold(
                                                    0,
                                                    (sum, review) =>
                                                        sum + review["rating"],
                                                  );
                                              widget.product["rating"] =
                                                  (totalRatings /
                                                          widget
                                                              .product["reviews"]
                                                              .length)
                                                      .toStringAsFixed(1);
                                              _reviewController.clear();
                                              _userRating = 0;
                                            });
                                          }
                                        },
                                        child: const Text("Submit Review"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.addToCart(widget.product, quantity);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.buyNow(widget.product, quantity);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Buy Now"),
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
}

// Wishlist Page
class WishlistPage extends StatelessWidget {
  final List<Map<String, dynamic>> wishlist;
  final Function(Map<String, dynamic>) toggleWishlist;

  const WishlistPage({
    super.key,
    required this.wishlist,
    required this.toggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body:
          wishlist.isEmpty
              ? const Center(child: Text('Your wishlist is empty'))
              : ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final product = wishlist[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        product["imageUrl"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
                      ),
                      title: Text(product["name"]!),
                      subtitle: Text(product["price"]!),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () => toggleWishlist(product),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailsPage(
                                  product: product,
                                  addToCart:
                                      (
                                        _,
                                        __,
                                      ) {}, // These will be replaced in details page
                                  buyNow: (_, __) {},
                                  isWishlisted: true,
                                  toggleWishlist: toggleWishlist,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}

// Buy Now Page
class BuyNowPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final int quantity;
  final Function(List<Map<String, dynamic>>, double) placeOrder;
  final Map<String, String> userProfile;
  final Function(Map<String, String>) updateProfile;

  const BuyNowPage({
    super.key,
    required this.product,
    required this.quantity,
    required this.placeOrder,
    required this.userProfile,
    required this.updateProfile,
  });

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the form with user profile data
    _nameController.text = widget.userProfile["name"]!;
    _phoneController.text = widget.userProfile["phone"]!;
    _addressController.text = widget.userProfile["address"]!;
    _pincodeController.text = widget.userProfile["pincode"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buy Now")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product: ${widget.product["name"]}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Price: ${widget.product["price"]}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Quantity: ${widget.quantity}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: "Pincode"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your pincode";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update user profile
                    widget.updateProfile({
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "address": _addressController.text,
                      "pincode": _pincodeController.text,
                    });

                    // Place the order
                    widget.placeOrder(
                      [
                        {
                          "product": widget.product,
                          "quantity": widget.quantity,
                        },
                      ],
                      double.parse(
                            widget.product["price"]!.replaceAll(
                              RegExp(r'[^0-9]'),
                              '',
                            ),
                          ) *
                          widget.quantity,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order placed successfully!"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );

                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                child: const Text("Place Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Page with Order History
class ProfilePage extends StatefulWidget {
  final Map<String, String> userProfile;
  final Function(Map<String, String>) updateProfile;

  const ProfilePage({
    super.key,
    required this.userProfile,
    required this.updateProfile,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill the form with user profile data
    _nameController.text = widget.userProfile["name"]!;
    _phoneController.text = widget.userProfile["phone"]!;
    _addressController.text = widget.userProfile["address"]!;
    _pincodeController.text = widget.userProfile["pincode"]!;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
              icon: Icon(_isEditing ? Icons.save : Icons.edit),
              onPressed: () {
                if (_isEditing) {
                  if (_formKey.currentState!.validate()) {
                    // Update user profile
                    widget.updateProfile({
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "address": _addressController.text,
                      "pincode": _pincodeController.text,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully!"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );
                  }
                }
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [Tab(text: 'Profile'), Tab(text: 'Orders')],
          ),
        ),
        body: TabBarView(
          children: [
            // Profile Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: Text(
                          widget.userProfile["name"]!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "Name"),
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: TextEditingController(
                        text: widget.userProfile["email"],
                      ),
                      decoration: const InputDecoration(labelText: "Email"),
                      enabled: false,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                      ),
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(labelText: "Address"),
                      enabled: _isEditing,
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _pincodeController,
                      decoration: const InputDecoration(labelText: "Pincode"),
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your pincode";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Orders Tab
            const Center(child: Text('Order history will appear here')),
          ],
        ),
      ),
    );
  }
}

// Cart Page with Coupon Functionality
class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _couponController = TextEditingController();
  double _discount = 0;
  String _couponMessage = '';

  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Item removed from cart"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  void removeAllItems() {
    setState(() {
      widget.cartItems.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("All items removed from cart"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  void applyCoupon() {
    const validCoupons = {"SAVE10": 0.1, "SAVE20": 0.2, "WELCOME": 0.15};

    final coupon = _couponController.text.trim().toUpperCase();
    if (validCoupons.containsKey(coupon)) {
      setState(() {
        _discount = validCoupons[coupon]!;
        _couponMessage =
            'Coupon applied! ${(_discount * 100).toInt()}% discount';
      });
    } else {
      setState(() {
        _discount = 0;
        _couponMessage = 'Invalid coupon code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = widget.cartItems.fold(
      0,
      (sum, item) =>
          sum +
          double.parse(
                item["product"]["price"]!.replaceAll(RegExp(r'[^0-9]'), ''),
              ) *
              item["quantity"],
    );
    double discountAmount = subtotal * _discount;
    double total = subtotal - discountAmount;

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body:
          widget.cartItems.isEmpty
              ? const Center(child: Text("Your cart is empty"))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.cartItems[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(
                              item["product"]["imageUrl"]!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                            ),
                            title: Text(item["product"]["name"]!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${item["product"]["price"]!} x ${item["quantity"]}",
                                ),
                                Text(
                                  "Total: ₹${double.parse(item["product"]["price"]!.replaceAll(RegExp(r'[^0-9]'), '')) * item["quantity"]}",
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeFromCart(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (widget.cartItems.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _couponController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter coupon code",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: applyCoupon,
                                child: const Text("Apply"),
                              ),
                            ],
                          ),
                          if (_couponMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                _couponMessage,
                                style: TextStyle(
                                  color:
                                      _discount > 0 ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Subtotal:"),
                                    Text("₹$subtotal"),
                                  ],
                                ),
                                if (_discount > 0)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount (${(_discount * 100).toInt()}%):",
                                      ),
                                      Text(
                                        "-₹${discountAmount.toStringAsFixed(2)}",
                                      ),
                                    ],
                                  ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹${total.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: removeAllItems,
                                child: const Text("Remove All"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CheckoutPage(
                                            cartItems: widget.cartItems,
                                            totalPrice: total,
                                          ),
                                    ),
                                  );
                                },
                                child: const Text("Proceed to Checkout"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
    );
  }
}

// Checkout Page
class CheckoutPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...cartItems.map(
              (item) => Text(
                "${item["product"]["name"]!} - ${item["product"]["price"]!} x ${item["quantity"]}",
              ),
            ),
            const Divider(),
            Text(
              "Total: ₹$totalPrice",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => OrderConfirmationPage(
                          cartItems: cartItems,
                          totalPrice: totalPrice,
                        ),
                  ),
                );
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// Order Confirmation Page
class OrderConfirmationPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  const OrderConfirmationPage({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Confirmation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              "Order Placed Successfully!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Total: ₹$totalPrice", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

// Order History Page
class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const OrderHistoryPage({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order History")),
      body:
          orders.isEmpty
              ? const Center(child: Text("No orders found"))
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text("Order #${index + 1}"),
                      subtitle: Text("Total: ₹${order["totalPrice"]}"),
                      trailing: Text(order["date"].toString().split(' ')[0]),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...order["items"].map(
                                (item) => ListTile(
                                  leading: Image.network(
                                    item["product"]["imageUrl"]!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                  title: Text(item["product"]["name"]!),
                                  subtitle: Text(
                                    "${item["product"]["price"]!} x ${item["quantity"]}",
                                  ),
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹${order["totalPrice"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
