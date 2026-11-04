import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('Pizza House menu displays correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PizzaHouseApp());

    expect(find.text('🍕 Pizza House'), findsOneWidget);
    expect(find.text('Our Menu'), findsOneWidget);
    expect(find.text('Margherita Pizza'), findsOneWidget);
    expect(find.text('Pepperoni Pizza'), findsOneWidget);
    expect(find.text('Hawaiian Pizza'), findsOneWidget);
  });
}
