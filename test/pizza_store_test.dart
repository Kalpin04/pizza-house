import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Menu displays all three food items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PizzaStoreApp());

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('Tapping a menu item opens its detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza'), findsNWidgets(2));
    expect(find.textContaining('fresh vegetables'), findsOneWidget);
    expect(find.text('Back to Menu'), findsOneWidget);
  });

  testWidgets('Back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Cheese Pizza'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Back to Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });
}
