// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(appBar: AppBar(title: Text("NASA Images")))));
    final text = find.byType(Text);
    expect(find.text("NASA Images"), findsOneWidget);
    // final text = find.text("NASA Images");
    // expect(text, findsOneWidget);
    // expect(find.text('NASA Images'), findsOneWidget);
    print('');
  });
}
