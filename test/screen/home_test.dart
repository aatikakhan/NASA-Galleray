import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_gallery/main.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/service/data_provider.dart';
import 'package:provider/provider.dart';

class MockContext extends Mock implements BuildContext {}

Widget createHomeScreen() => ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: const MaterialApp(
        home: NASAGallery(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing for Scaffold', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byKey(const Key("GlobalKey")), findsOneWidget);
    });

    testWidgets('Test for Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle( const Duration(seconds: 20));
      // expect(
      //   find.byKey(const ValueKey("Button0")),
      //   findsOneWidget,
      // );


  DataProvider dataProvider = DataProvider();

      BuildContext context = MockContext();
      List<DataObject>? objList = await DataProvider().loadData(context);

      await tester.pumpWidget(createHomeScreen(), const Duration(seconds: 20));
      await tester.pumpAndSettle();
      // expect(
      //   find.byKey(const ValueKey("Button")),
      //   findsWidgets,
      // );
    
      await tester.fling(find.byType(GridView), const Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(
          find.byWidget(GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )),
          findsNothing);
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
