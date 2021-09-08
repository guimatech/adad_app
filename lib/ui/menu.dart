import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final WidgetBuilder builder;

  Menu({
    @required this.icon,
    @required this.title,
    @required this.child,
    this.builder,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: builder
                )
            )
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildContainerTop(context),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerTop(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 15),
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 20,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
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
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
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