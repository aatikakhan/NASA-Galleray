import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/screens/detail.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
import 'package:provider/provider.dart';

import '../service/data_provider.dart';

class Home extends StatelessWidget {
  static String id = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataObject>? obj;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(key: const Key("NASA Images"),
        title: const Text("NASA Images"),
      ),
      body: FutureBuilder(
        key: const Key("GlobalKey"),
        future: Provider.of<DataProvider>(context).loadData(context),
        builder: (context, AsyncSnapshot<List<DataObject>?> snapshot) {
          if (snapshot.hasData) {
            obj = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: obj == null ? 0 : obj!.length,
              itemBuilder: (BuildContext conext, i) {
                return ElevatedButton(
                  key: const ValueKey("Button"),
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
                    );
                  }),
                  child: ImageWidget(
                    key: const Key("imageWidget"),
                    imageUrl: obj![i].url!,
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
