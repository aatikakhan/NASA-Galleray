import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';

class Home extends StatelessWidget {
  static String id = 'home';

  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Container(
            color: Colors.white,
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DataObject> obj = (json
                            .decode(snapshot.data.toString()) as List)
                        .map((data) =>
                            DataObject.fromJson(data as Map<String, dynamic>))
                        .toList();
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int i) {
                        return Text(
                          obj[i].title!,
                        );
                      },
                      itemCount: obj == null ? 0 : obj.length,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })));
  }
}
