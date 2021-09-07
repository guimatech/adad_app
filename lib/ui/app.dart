import 'package:adad_app/events/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  @override
  void initState(){
    super.initState();
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
      color: Color(0xFF6E9ADD),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 1,
          children: <Widget>[
              Page(
                icon: Icons.event,
                title: 'Próximo evento',
                child: buildNextEventContainer(context),
                nextIcon: Icons.event,
                nextTitle: 'Reunião de líderes, Sexta-feira, 14 de fevereiro de 2020',
              ),
              Page(
                icon: Icons.monetization_on,
                title: 'Caixa',
                child: buildBalanceContainer(context),
                nextIcon: Icons.save_alt,
                nextTitle: 'Pagamento de R\$ 130,00 recebido de Fulano de Tal',
              ),
            ],
          )
    );
  }

  Widget buildNextEventContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Widget buildBalanceContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, bottom: 30),
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

class Page extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final IconData nextIcon;
  final String nextTitle;

  Page({
    @required this.icon,
    @required this.title,
    @required this.child,
    @required this.nextIcon,
    @required this.nextTitle,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EventPage()
                )
            )
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 250,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildContainerTop(),
                child,
                buildContainerBottom(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerTop() {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
            size: 25,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'Trueno',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerBottom(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 50,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  nextIcon,
                  color: Colors.grey,
                  size: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: Theme.of(context).textTheme.display1.fontSize * 1.1 + 170.0,
                  child: Text(
                    nextTitle,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontFamily: 'Trueno',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.grey,
              size: 25,
            )
          ]
      ),
    );
  }
}

