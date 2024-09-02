import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Varity Testing Widget", () {
    //! find widget by text
    testWidgets('finds a Text widget', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text('H'),
        ),
      ));
      expect(find.text('H'), findsOneWidget);
    });

    //! find widget by key
    testWidgets('finds a widget using a Key', (tester) async {
      const testKey = Key('K');
      await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));
      expect(find.byKey(testKey), findsOneWidget);
    });
    //! find widget by instance
    testWidgets('finds a specific instance', (tester) async {
      const childWidget = Padding(padding: EdgeInsets.zero);
      await tester.pumpWidget(Container(child: childWidget));
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
  
}
