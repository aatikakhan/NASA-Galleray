import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_gallery/main.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/screens/home.dart';
import 'package:nasa_gallery/service/data_provider.dart';

class MockDataProvider extends Mock implements DataProvider {}

class MockContext extends Mock implements BuildContext {}

void main() {
  final provider = MockDataProvider();

  test('testing Object List', () async {
    BuildContext context = MockContext();

    when(() => provider.loadData(context)).thenAnswer((_) {
      return Future.value;
    });
    List<DataObject>? result = provider.objList;
    expect(result, List<DataObject>);
  });
  testWidgets("home page test", (WidgetTester tester) async {
    Home home = Home();
    await tester.pumpWidget(home);
    Finder text = find.byKey(new Key('NASA Images'));
    expect(text.toString(), true);
  });
}
