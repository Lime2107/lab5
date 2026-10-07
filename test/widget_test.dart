import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_labs/main.dart';

void main() {
  testWidgets('RecipeApp loads and displays headers', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify section headers are present.
    expect(find.text('BY MEAT'), findsOneWidget);
    expect(find.text('BY COURSE'), findsOneWidget);
    expect(find.text('BY DESSERT'), findsOneWidget);
    expect(find.text('HAPPY COOKING!'), findsOneWidget);
  });
}
