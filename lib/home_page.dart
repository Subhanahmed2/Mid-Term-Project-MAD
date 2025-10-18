import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _allFoods = [
    {'name': 'Burger', 'image': 'assets/images/burger.jpg'},
    {'name': 'Pizza', 'image': 'assets/images/pizza.jpg'},
    {'name': 'Fries', 'image': 'assets/images/fries.jpg'},
    {'name': 'Pasta', 'image': 'assets/images/pasta.jpg'},
    {'name': 'Sandwich', 'image': 'assets/images/sandwich.jpg'},
    {'name': 'Hot Dog', 'image': 'assets/images/hotdog.jpg'},
    {'name': 'Ice Cream', 'image': 'assets/images/icecream.jpg'},
    {'name': 'Salad', 'image': 'assets/images/salad.jpg'},
  ];

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

  void _openSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(foods: _allFoods),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('🍔 Subhan’s Food Menu'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _openSearchPage,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Welcome to Subhan’s Food App!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              icon: const Icon(Icons.restaurant_menu),
              label: const Text('View Menu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  final List<Map<String, String>> foods;
  SearchPage({required this.foods});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredFoods = [];

  @override
  void initState() {
    super.initState();
    _filteredFoods = widget.foods;
  }

  void _filterFoods(String query) {
    final results = widget.foods
        .where((food) =>
        food['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredFoods = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Foods'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterFoods,
              decoration: const InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _filteredFoods.isEmpty
                  ? const Center(child: Text('No food found'))
                  : ListView.builder(
                itemCount: _filteredFoods.length,
                itemBuilder: (context, index) {
                  final food = _filteredFoods[index];
                  return ListTile(
                    leading: Image.asset(
                      food['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(food['name']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
