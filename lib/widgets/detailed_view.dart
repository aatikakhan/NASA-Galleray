import 'package:flutter/material.dart';

import '../model/data_object.dart';

class DetailWidget extends StatelessWidget {
  final DataObject e;
  const DetailWidget({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget space = const SizedBox(height: 16);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space,
            Text(
              e.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    '- ${e.copyright ?? ''}',
                    maxLines: 2,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Text('Date: ${e.date ?? ''}'),
              ],
            ),
            space,
            Text(e.explanation ?? ''),
            space
          ],
        ),
      ),
    );
  }
}
