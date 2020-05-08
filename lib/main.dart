import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:adad_app/blocs/floating_cards_bloc.dart';
import 'package:adad_app/ui/app.dart';

void main() => runApp(MaterialApp(
    home: _AdadApp(),
  ));

class _AdadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        Provider<FloatingCardsBloc>.value(value: FloatingCardsBloc()),
      ],
      child: MaterialApp(
        title: 'ADAD App',
        home: App(),
        color: Colors.blue,
        theme: ThemeData(
          accentColor: Color(0xFF0D47A1)
        ),
      ),
    );
  }
}
