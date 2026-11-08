import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Order Summary displays correct order details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.ensureVisible(find.text('View Order Summary'));
    await tester.tap(find.text('View Order Summary'));
    await tester.pumpAndSettle();

    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
    expect(find.text('RM25.00'), findsOneWidget);
    expect(find.text('Total: RM25.00'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
  });
}
