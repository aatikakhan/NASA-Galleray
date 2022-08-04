import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/screens/home.dart';
import 'package:nasa_gallery/service/data_provider.dart';

class MockDataProvider extends Mock implements DataProvider {}

class MockContext extends Mock implements BuildContext {}
class MockDataObject extends Mock implements DataObject {}

void main() {
  final provider = MockDataProvider();
  BuildContext context = MockContext();
  DataObject dataObject = DataObject();
  test('testing Object List', () async {
    List<DataObject>? objList;

    objList = List<DataObject>.filled(24, dataObject, growable: true);
    List<DataObject>? result = objList;
    expect(result, List<DataObject>);
  });
  testWidgets("home page test", (WidgetTester tester) async {
    Home home = const Home();
    await tester.pumpWidget(home);
    expect(
      find.byKey(const ValueKey("Button")),
      findsOneWidget,
    );
    expect(find.byKey(const Key("NASA Images")), true);
  });
}
