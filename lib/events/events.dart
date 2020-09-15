import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adad_app/events/shared/event.model.dart';
import 'package:adad_app/events/shared/event.service.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key}) : super(key: key);

  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Future<List<Event>> futureListEvent;

  @override
  void initState(){
    super.initState();
    futureListEvent = EventService().getAll();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF0D47A1))
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Próximos eventos',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Event>>(
          future: futureListEvent,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? eventList(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
          Theme.of(context).colorScheme.copyWith(secondary: Color(0xFF0D47A1)),
        ),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  StatelessWidget eventList(List<Event> events) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              events[index].date.day.toString(),
              style: TextStyle(
                color: Color(0xFF0D47A1),
                fontSize: 58,
                fontFamily: 'Trueno',
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              events[index].date.weekday.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontFamily: 'Trueno',
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "${events[index].date.month.toString()} de ${events[index].date.year.toString()}" ,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontFamily: 'Trueno',
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              events[index].description,
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontFamily: 'Trueno',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        );
      },
    );
  }
}