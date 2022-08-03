import 'package:flutter/material.dart';
import 'package:nasa_gallery/widgets/imageloader.dart';

import '../arguments/arguments.dart';
import '../model/data_object.dart';

class Detail extends StatelessWidget {
  static const id = '/detail';
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    Widget space = const SizedBox(height: 16);
    List<DataObject> obj = args.obj;
    return Scaffold(
      appBar: AppBar(
        title: Text(obj[args.index].title.toString()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      child: ImageWidget(imageUrl: obj[args.index].url!)),
                ),
                space,
                Text(
                  obj[args.index].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text(
                          '- ${obj[args.index].copyright!}',
                          maxLines: 2,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        )),
                    Text('Date: ${obj[args.index].date!}'),
                  ],
                ),
                space,
                Text(obj[args.index].explanation!),
                space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
