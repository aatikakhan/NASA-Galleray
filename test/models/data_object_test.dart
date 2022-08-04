import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/service/data_provider.dart';

void main() {
  group('Testing App Provider', () {
    DataProvider dataProvider = DataProvider();

    test('A new item should be added', () {
    String number = "20-03-1";
    
      expect(dataProvider.objList!.contains(number), true);
      
    });    
  });
}