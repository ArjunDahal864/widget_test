import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/books.dart';

void main() {
  group(
    "list screen test ",
    () {
      testWidgets(
        "test with single item",
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Books(
                  numbers: 5,
                ),
              ),
            ),
          );
          await tester.drag(
            find.byType(ListView),
            const Offset(
              0,
              -3000,
            ),
          );
          await tester.pump();
          final bookFinder = find.text("0 Book");
          expect(bookFinder, findsOneWidget);
        },
      );

      testWidgets(
        "test with more items",
        (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: Books(numbers: 21),
            ),
          ));
          await tester.drag(find.byType(ListView), const Offset(0, -600));
          await tester.pump();

          final fistFinder = find.text("0 Book");
          final twentyBookFinder = find.text("20 Book");
          expect(fistFinder, findsNothing);
          expect(twentyBookFinder, findsOneWidget);
        },
      );

      testWidgets(
        "test size in small screen",
        (WidgetTester tester) async {
          tester.binding.window.physicalSizeTestValue = Size(320, 350);
          await tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: Books(numbers: 21),
            ),
          ));
          await tester.drag(find.byType(ListView), const Offset(0, -600));
          await tester.pump();
          final fistFinder = find.text("0 Book");
          final twentyBookFinder = find.text("12 Book");
          expect(fistFinder, findsNothing);
          expect(twentyBookFinder, findsOneWidget);
        },
      );
    },
  );
}
