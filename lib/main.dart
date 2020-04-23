import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADAD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ADAD App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget buildNextEventContainer(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Próximo evento',
                style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                  )
              ),
              Text(
                '$_counter',
                style: Theme.of(context)
                  .textTheme
                  .display4
                  .copyWith(color: Colors.white)
              ),
              Text(
                'Sábado',
                style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white),
              ),
              Text(
                'Janeiro de 2020',
                style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white),
              ),
              Text(
                'AcampADAD Extreme',
                style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(
                    fontSize: 14,
                    color: Colors.white
                  ),
              ),
          ],
        ),
        transform: Matrix4.rotationZ(0.1),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildNextEventContainer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
