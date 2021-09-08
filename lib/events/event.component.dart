import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:adad_app/events/shared/event.model.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  EventWidget({
    @required this.event,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildNextEventContainer(event);
  }

  Widget buildNextEventContainer(Event event) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          event.date.day.toString(),
          style: TextStyle(
            color: Color(0xFF0D47A1),
            fontSize: 58,
            fontFamily: 'Trueno',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          DateFormat.EEEE().format(event.date),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontFamily: 'Trueno',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          "${DateFormat.MMMM().format(event.date)} de ${event.date.year.toString()}" ,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontFamily: 'Trueno',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          event.description,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontFamily: 'Trueno',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}