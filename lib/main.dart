import 'package:flutter/material.dart';
import 'package:news_app/modules/splashscreen.dart';
import 'package:news_app/shared/shared_network/remote/diohelper.dart';

import 'layout/applayout.dart';
import 'models/newsmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Article> data = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Applayout(),
    );
  }
}
