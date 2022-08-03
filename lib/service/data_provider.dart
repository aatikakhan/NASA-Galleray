import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/data_object.dart';

class DataProvider with ChangeNotifier {
  List<DataObject>? objList;

  Future<List<DataObject>?> loadData(BuildContext context) async {
await DefaultAssetBundle.of(context).loadString('assets/data.json').then((value) {
      objList = (json.decode(value.toString()) as List)
          .map((data) => DataObject.fromJson(data as Map<String, dynamic>))
          .toList();
    });
    return objList;
  }
}
