import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:adad_app/blocs/floating_cards_bloc.dart';
import 'package:adad_app/ui/app.dart';

void main() => runApp(new _AdadApp());

class _AdadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFF0D47A1))
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        Provider<FloatingCardsBloc>.value(value: FloatingCardsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ADAD App',
        home: App(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xFF0D47A1),
          accentColor: Color(0xFF0D47A1),
          fontFamily: 'Trueno',
        ),
      ),
    );
  }
}
