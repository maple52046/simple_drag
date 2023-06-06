import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_drag/simple_drag.dart';

void main() {
  testWidgets('SimpleDrag widget test', (WidgetTester tester) async {
    // Build the SimpleDrag widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SimpleDrag<String>(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            onDragStarted: () {
              // Add your test logic here for onDragStarted callback
              print('Drag started!');
            },
            onDragEnd: (details) {
              // Add your test logic here for onDragEnd callback
              print('Drag ended!');
            },
          ),
        ),
      ),
    );

    // Perform test actions
    await tester.drag(find.byType(SimpleDrag), const Offset(100, 100));
    await tester.pumpAndSettle();

    // Add your test expectations/assertions here
    expect(find.text('Drag started!'), findsOneWidget);
    expect(find.text('Drag ended!'), findsNothing);
  });
}
