import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nasa_gallery/model/data_object.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';
import 'package:provider/provider.dart';

import '../service/data_provider.dart';

class Detail extends StatelessWidget {
  static const id = '/detail';
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    List<DataObject> imageList =
        Provider.of<DataProvider>(context, listen: false).objList!;
    int index = Provider.of<DataProvider>(context, listen: false).index!;

    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage:
                Provider.of<DataProvider>(context, listen: false).index!,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: false,
          ),
          items: imageList
              .map((e) => Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
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

class DetailWidget extends StatelessWidget {
  final DataObject e;
  const DetailWidget({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget space = const SizedBox(height: 16);

    return SingleChildScrollView(
      child: Column(
        children: [
          space,
          Text(
            e.title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          space,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    '- ${e.copyright!}',
                    maxLines: 2,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Text('Date: ${e.date!}'),
              ],
            ),
          ),
          space,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(e.explanation!),
          ),
          space
        ],
      ),
    );
  }
}
