import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_gallery/main.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/screens/detail.dart';
import 'package:nasa_gallery/service/data_provider.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
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
    // BEGINNING OF NEW CONTENT
    testWidgets('Testing if GridView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(GridView), findsOneWidget);
      expect(find.text("NASA Images"), findsOneWidget);
    });
    // END OF NEW CONTENT

    testWidgets('Test for Scrolling', (tester) async {
      DataProvider dataProvider = DataProvider();

      BuildContext context = MockContext();
      List<DataObject>? objList;

      Future<List<DataObject>?> loadData(BuildContext context) async {
        await DefaultAssetBundle.of(context)
            .loadString('assets/data.json')
            .then((value) {
          objList = (json.decode(value.toString()) as List)
              .map((data) => DataObject.fromJson(data as Map<String, dynamic>))
              .toList();
        });
        return objList;
      }

      await tester.pumpWidget(createHomeScreen());
      expect(
          find.byWidget(ElevatedButton(
            onPressed: () {
              dataProvider.index = 1;

              Navigator.pushNamed(context, Detail.id);
            },
            child: ImageWidget(
              imageUrl: objList![1].url!,
            ),
          )),
          findsOneWidget);
      await tester.fling(find.byType(GridView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
