import 'package:flutter/material.dart';
import 'package:adad_app/blocs/floating_cards_bloc.dart';
import 'package:provider/provider.dart';

class BackdropInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BackdropInfoState();
  }
}

class _BackdropInfoState extends State<BackdropInfo> {
  @override
  Widget build(BuildContext context) {
    FloatingCardsBloc floatingCardBloc =
        Provider.of<FloatingCardsBloc>(context);

    return StreamBuilder(
      stream: floatingCardBloc.topPercentage.stream,
      initialData: floatingCardBloc.topPercentage.value,
      builder: (_, __) {
        return Opacity(
          opacity: 1 - floatingCardBloc.topPercentageToOpacity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 95,
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/qrcode.png'),
                              height: 100,
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                _buildInfoText(),
                                SizedBox(
                                  height: 30,
                                ),
                                _buildListDivider(),
                                _buildListItem('Me ajuda', Icons.help_outline),
                                _buildListDivider(),
                                _buildListItem('Perfil', Icons.account_circle),
                                _buildListDivider(),
                                _buildListItem(
                                    'Configurar App', Icons.settings),
                                _buildListDivider(),
                                SizedBox(
                                  height: 30,
                                ),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  height: 50,
                                  child: OutlineButton(
                                    child: Text(
                                      'Sair da conta'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Trueno',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    onPressed: () {},
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    highlightedBorderColor:
                                        Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoText() {
    return Column(
      children: <Widget>[
        Text.rich(
          TextSpan(
            text: 'Patente ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Trueno',
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: 'Lider',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text.rich(
          TextSpan(
            text: 'Classes ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Trueno',
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                  text: '2 e Sênior',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text.rich(
          TextSpan(
            text: 'Contato ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Trueno',
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: '(77) 9 9935-6548',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String text, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Spacer(),
          Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildListDivider() {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      height: 1.5,
    );
  }
}
