import 'package:adad_app/events/event.component.dart';
import 'package:adad_app/events/events.dart';
import 'package:adad_app/events/shared/event.model.dart';
import 'package:adad_app/events/shared/event.service.dart';
import 'package:adad_app/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  Future<Event> futureEvent;

  @override
  void initState(){
    super.initState();
    futureEvent = EventService().getLast();
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
          'ADADApp',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: menuList()
      ),
    );
  }

  StatelessWidget menuList() {
    return Container(
      color: Colors.grey[100],
      child: StaggeredGridView.count(
        primary: false,
        crossAxisCount: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        staggeredTiles: <StaggeredTile>[
          StaggeredTile.count(1, .4),
          StaggeredTile.count(1, .6),
        ],
        children: <Widget>[
          Menu(
            icon: Icons.monetization_on,
            title: 'Caixa',
            child: buildBalanceContainer(context),
          ),
          Menu(
            icon: Icons.event,
            title: 'Próximo evento',
            child: FutureBuilder<Event>(
                future: futureEvent,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? EventWidget(event: snapshot.data)
                      : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(child: CircularProgressIndicator()
                      )
                  );
                }
            ),
            builder: (_) => EventPage(),
          ),
        ],
      ),
    );
  }

  Widget buildBalanceContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Saldo disponível',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'R\$ 995,83',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 40,
                    fontFamily: 'Trueno',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}

