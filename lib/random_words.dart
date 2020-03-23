  import 'package:flutter/material.dart';
  import 'package:english_words/english_words.dart';
  import 'backdrop.dart';
  import 'menu_page.dart';
  import 'model/menu.dart';

  class RandomWords extends StatefulWidget {
    @override
    RandomWordsState createState() => RandomWordsState();
  }

  class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        onTap: () {

        },
      );
    }

    Widget _buildSuggestions() {
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            return _buildRow(_suggestions[index]);
          }
      );
    }

    Widget _buildSaved(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
      );
    }

    void _pushSaved() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: _buildSaved,
        ),
      );
    }

    Menu _currentMenu;

    void _onMenuTap(Menu menu) {
      setState(() {
        _currentMenu = menu;
      });
    }

    @override
    Widget build(BuildContext context) {
      final Menu home = Menu('Home', _buildSuggestions());
      final Menu config = Menu('Configurações', _buildSaved(context));
      final List<Menu> _menus = <Menu>[home, config];
      if (_currentMenu == null) {
        _currentMenu = home;
      }

      return Backdrop(
          currentMenu: _currentMenu,
          frontLayer: _currentMenu.screen,
          backLayer: MenuPage(
            currentMenu: _currentMenu,
            onMenuTap: _onMenuTap,
            menus: _menus,
          ),
          frontTitle: Text(_currentMenu.title),
          backTitle: Text('MENU'),
          configLayer: IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
      );
    }
  }