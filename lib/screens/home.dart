import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/screens/detail.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
import 'package:provider/provider.dart';

import '../arguments/arguments.dart';
import '../service/data_provider.dart';

class Home extends StatelessWidget {
  static String id = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataObject>? obj;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("NASA Images"),
      ),
      body: FutureBuilder(
        future: Provider.of<DataProvider>(context).loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            obj = snapshot.data as List<DataObject>?;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: obj == null ? 0 : obj!.length,
              itemBuilder: (BuildContext conext, i) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  onPressed: (() {
                    Provider.of<DataProvider>(context, listen: false).index = i;
                    Navigator.pushNamed(
                      context,
                      Detail.id,
                      arguments: Arguments(obj![i].url!, obj!, i),
                    );
                  }),
                  child: ImageWidget(
                    imageUrl: obj![i].url!,
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
