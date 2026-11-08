import 'package:flutter/material.dart';

import 'order_summary.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  static const Map<String, WidgetBuilder> routes = {
    '/menu': MenuScreen.routeBuilder,
    '/vegetable': VegetableScreen.routeBuilder,
    '/cheese': CheeseScreen.routeBuilder,
    '/fries': FriesScreen.routeBuilder,
    '/order-summary': OrderSummary.routeBuilder,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/menu',
      routes: routes,
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static Widget routeBuilder(BuildContext context) => const MenuScreen();

  static const List<Map<String, String>> items = [
    {
      'name': 'Vegetable Pizza',
      'description': 'Fresh vegetables and melted cheese.',
      'image': 'assets/images/vegetable.png',
      'route': '/vegetable',
    },
    {
      'name': 'Cheese Pizza',
      'description': 'Classic pizza with extra cheese.',
      'image': 'assets/images/cheese.png',
      'route': '/cheese',
    },
    {
      'name': 'Box of Fries',
      'description': 'Golden and crispy French fries.',
      'image': 'assets/images/fries.png',
      'route': '/fries',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'Pizza Store Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Choose Your Favourite!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Card(
              color: Colors.orange,
              margin: const EdgeInsets.only(bottom: 16),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Image.asset(
                  item['image']!,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  item['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  item['description']!,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, item['route']!);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/order-summary');
            },
            child: const Text('View Order Summary'),
          ),
        ],
      ),
    );
  }
}

class VegetableScreen extends StatelessWidget {
  const VegetableScreen({super.key});

  static Widget routeBuilder(BuildContext context) => const VegetableScreen();

  @override
  Widget build(BuildContext context) {
    return const FoodDetailScreen(
      itemName: 'Vegetable Pizza',
      imagePath: 'assets/images/vegetable.png',
      description:
          'A delicious pizza topped with fresh vegetables, '
          'tomatoes, mushrooms, olives and melted cheese.',
    );
  }
}

class CheeseScreen extends StatelessWidget {
  const CheeseScreen({super.key});

  static Widget routeBuilder(BuildContext context) => const CheeseScreen();

  @override
  Widget build(BuildContext context) {
    return const FoodDetailScreen(
      itemName: 'Cheese Pizza',
      imagePath: 'assets/images/cheese.png',
      description:
          'A classic cheese pizza covered with rich tomato '
          'sauce and delicious melted mozzarella cheese.',
    );
  }
}

class FriesScreen extends StatelessWidget {
  const FriesScreen({super.key});

  static Widget routeBuilder(BuildContext context) => const FriesScreen();

  @override
  Widget build(BuildContext context) {
    return const FoodDetailScreen(
      itemName: 'Box of Fries',
      imagePath: 'assets/images/fries.png',
      description:
          'Enjoy crispy golden French fries, freshly prepared '
          'and served in a Pizza House box.',
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final String description;

  const FoodDetailScreen({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: Text(itemName),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath, height: 260, fit: BoxFit.cover),
            ),
            const SizedBox(height: 24),
            Text(
              itemName,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Menu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
