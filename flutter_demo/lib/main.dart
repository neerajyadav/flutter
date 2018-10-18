import 'package:flutter/material.dart';

import 'categoryRoute.dart';

void main() {
  runApp(UnitConversionApp());
}

class UnitConversionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.grey[600],
            ),
        primaryColor: Colors.grey[500],
        textSelectionHandleColor: Colors.green[500],

        scaffoldBackgroundColor: Colors.green[100],
        highlightColor: Colors.amber,
        splashColor: Colors.amber,
        selectedRowColor: Colors.brown[400],
      ),
      home: CategoryRoute(),
    );
  }
}
