import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
import 'package:provider/provider.dart';

import '../service/data_provider.dart';

class Home extends StatelessWidget {
  static String id = 'home';
    static String detailRoute = 'detail';


  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataObject>? obj;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Home")),
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
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.white) ,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: () =>Navigator.pushNamed(context, detailRoute),
                  child: ImageWidget(imageUrl: obj![i].url!,)
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
