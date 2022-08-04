import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
import 'package:provider/provider.dart';

import '../service/data_provider.dart';
import '../widgets/detailed_view.dart';

class Detail extends StatelessWidget {
  static const id = '/detail';
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    List<DataObject>? imageList = Provider.of<DataProvider>(context).objList;
    int index = Provider.of<DataProvider>(context, listen: false).index!;

    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: index,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: false,
          ),
          items: imageList!
              .map((e) => Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .4,
                            child: ImageWidget(imageUrl: e.url!)),
                        Expanded(child: DetailWidget(e: e))
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

