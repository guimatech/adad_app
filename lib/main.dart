  import 'package:flutter/material.dart';
  import 'package:adadapp/random_words.dart';
  import 'package:adadapp/styled.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'ADAD App',
        theme: ThemeData(
          primarySwatch: white,
        ),
        home: RandomWords()
      );
    }
  }

