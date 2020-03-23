  import 'package:flutter/material.dart';
  import 'random_words.dart';
  import 'utils/colors.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'ADAD App',
        theme: ThemeData(
          primarySwatch: white,
        ),
        home: RandomWords(),
      );
    }
  }

