  import 'package:flutter/material.dart';
  import 'package:meta/meta.dart';
  import 'model/menu.dart';

  class MenuPage extends StatelessWidget {
    final Menu currentMenu;
    final ValueChanged<Menu> onMenuTap;
    final List<Menu> menus;

    const MenuPage({
      Key key,
      @required this.currentMenu,
      @required this.onMenuTap,
      @required this.menus,
    })  : assert(currentMenu != null),
          assert(onMenuTap != null),
          assert(menus != null);

    Widget _buildMenu(Menu menu, BuildContext context) {
      final ThemeData theme = Theme.of(context);

      return GestureDetector(
        onTap: () => onMenuTap(menu),
        child: menu.title == currentMenu.title
            ? Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              menu.title,
              style: theme.textTheme.body2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14.0),
            Container(
              width: 70.0,
              height: 2.0,
              color: Colors.blue,
            ),
          ],
        )
            : Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            menu.title,
            style: theme.textTheme.body2.copyWith(
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Center(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          color: Colors.blue,
          child: ListView(
              children: menus
                  .map((Menu m) => _buildMenu(m, context))
                  .toList()),
        ),
      );
    }
  }