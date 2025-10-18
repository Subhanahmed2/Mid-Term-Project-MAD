import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/menu');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/about');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('📘 About'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About This App',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'This app is built using Dart and Flutter to demonstrate Object-Oriented Programming (OOP).\n\n'
                    'We created a FoodItem class that includes properties such as name, price, and image.\n\n'
                    'The Menu page displays a list of these objects using Flutter widgets like Column, Row, Container, and Text.\n\n'
                    'Navigation between Home, Menu, and About pages is handled using the BottomNavigationBar and Navigator routes.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // ✅ No const keyword at list level; only inside items
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
