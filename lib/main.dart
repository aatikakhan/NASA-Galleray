import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/detail.dart';
import 'screens/home.dart';
import 'service/data_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NASAGallery());
}

class NASAGallery extends StatelessWidget {
  const NASAGallery({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Enables the Provider Package
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Colors.transparent,
        ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => const Home(),
          Detail.id: (context) => const Detail(),
        },
      ),
    );
  }
}
