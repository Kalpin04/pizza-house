import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaHouseApp());
}

class PizzaHouseApp extends StatelessWidget {
  const PizzaHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza House',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const PizzaMenuPage(),
    );
  }
}

class PizzaMenuPage extends StatelessWidget {
  const PizzaMenuPage({super.key});

  final List<Map<String, dynamic>> pizzas = const [
    {
      'name': 'Margherita Pizza',
      'description': 'Classic cheese, tomato and fresh basil.',
      'price': 18.90,
      'image':
          'https://images.unsplash.com/photo-1579751626657-72bc17010498?w=600',
      'icon': Icons.local_pizza,
    },
    {
      'name': 'Pepperoni Pizza',
      'description': 'Cheesy pizza topped with spicy pepperoni.',
      'price': 24.90,
      'image':
          'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=600',
      'icon': Icons.local_fire_department,
    },
    {
      'name': 'Hawaiian Pizza',
      'description': 'Sweet pineapple with ham and melted cheese.',
      'price': 22.90,
      'image':
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=600',
      'icon': Icons.star,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          '🍕 Pizza House',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping cart',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE0CC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh from the oven!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Your favourite pizzas, made with love.',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Our Menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final pizza = pizzas[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      Image.network(
                        pizza['image'],
                        width: 125,
                        height: 135,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 125,
                            height: 135,
                            color: Colors.orange.shade100,
                            child: const Icon(
                              Icons.local_pizza,
                              size: 55,
                              color: Colors.deepOrange,
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pizza['name'],
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                pizza['description'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'RM ${pizza['price'].toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(pizza['icon'], color: Colors.deepOrange),
                                ],
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
        ],
      ),
    );
  }
}
