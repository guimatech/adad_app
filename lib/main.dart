import 'package:adad_app/events/events.dart';
import 'package:adad_app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() => runApp(new _AdadApp());

class _AdadApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF0D47A1))
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Intl.defaultLocale = 'pt_br';
    initializeDateFormatting();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADAD App',
      home: AppPage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF0D47A1),
        accentColor: Color(0xFF0D47A1),
        fontFamily: 'Trueno',
      ),
    );
  }
}
