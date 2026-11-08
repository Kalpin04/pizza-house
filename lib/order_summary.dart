import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});
  static Widget routeBuilder(BuildContext context) {
    return const OrderSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Order',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.fastfood, color: Colors.orange),
              title: Text('Vegetable Pizza'),
              subtitle: Text('Quantity: 1'),
              trailing: Text('RM25.00'),
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Total: RM25.00',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
