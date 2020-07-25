import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final List<String> items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                Text(
                  '15',
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontSize: 58,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Sábado',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Janeiro de 2020',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'AcampADAD Extreme',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.w300,
                  ),
                ),
            ],
          ),
        ),
//          ListView.builder(
//            itemCount: items.length,
//            itemBuilder: (context, index) {
//              return ListTile(
//                title: Text('${items[index]}'),
//              );
//            },
//          ),
        ],
      ),
    );
  }
}