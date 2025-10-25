import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1;

  final List<Map<String, String>> foodItems = [
    {'name': 'Cheeseburger', 'price': '\$5.99', 'image': 'assets/images/burger.jpg'},
    {'name': 'Pizza Slice', 'price': '\$3.50', 'image': 'assets/images/pizza.jpg'},
    {'name': 'French Fries', 'price': '\$2.99', 'image': 'assets/images/fries.jpg'},
    {'name': 'Pasta Bowl', 'price': '\$4.99', 'image': 'assets/images/pasta.jpg'},
    {'name': 'Hot Dog', 'price': '\$3.20', 'image': 'assets/images/hotdog.jpg'},
    {'name': 'Ice Cream Cup', 'price': '\$2.50', 'image': 'assets/images/icecream.jpg'},
    {'name': 'Fresh Salad', 'price': '\$3.10', 'image': 'assets/images/salad.jpg'},
    
  ];

  void _onItemTapped(int index) {
    // ✅ Prevent reopening the same tab
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // Go back to home
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else if (index == 1) {
      // Already on Menu page — do nothing
      return;
    } else if (index == 2) {
      Navigator.pushNamedAndRemoveUntil(context, '/about', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('🍟 Our Delicious Menu'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final food = foodItems[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        food['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              food['price']!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
