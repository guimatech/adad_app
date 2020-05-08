import 'package:flutter/material.dart';
import 'package:adad_app/blocs/floating_cards_bloc.dart';
import 'package:adad_app/ui/backdrop_info.dart';
import 'package:adad_app/ui/floating_cards.dart';
import 'package:adad_app/ui/footer_cards.dart';
import 'package:adad_app/ui/header.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final GlobalKey _emptyExpandedKey = GlobalKey();

  Size _emptyExpandedSize = Size(0, 0);
  Offset _emptyExpandedPosition = Offset(0, 0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchEmptyExpandedInfo();
    });

    super.initState();
  }

  @override
  void dispose() {
    Provider.of<FloatingCardsBloc>(context).dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;

    double _height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    FloatingCardsBloc floatingCardBloc =
        Provider.of<FloatingCardsBloc>(context);

    floatingCardBloc.size.add(_emptyExpandedSize);
    floatingCardBloc.position.add(_emptyExpandedPosition);

    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: _height * 0.035),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Header(),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _buildEmptyExpanded(context),
                        FooterCards(),
                      ],
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      // fit: StackFit.expand,
                      children: <Widget>[
                        BackdropInfo(),
                        FloatingCards(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyExpanded(BuildContext context) {
    FloatingCardsBloc bloc = Provider.of<FloatingCardsBloc>(context);

    return Expanded(
      key: _emptyExpandedKey,
      child: StreamBuilder(
        stream: bloc.top.stream,
        initialData: bloc.top.value,
        builder: (_, AsyncSnapshot<double> snapshot) {
          return Opacity(
            opacity: snapshot.data > 50 ? 0 : 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: bloc.height.stream,
                  initialData: bloc.height.value,
                  builder: (_, AsyncSnapshot<double> snapshot) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: snapshot.data,
                    );
                  },
                ),
                StreamBuilder(
                  stream: bloc.pageController.stream,
                  initialData: bloc.pageController.value,
                  builder: (_, AsyncSnapshot<PageController> snapshot) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            FloatingCardsBloc.pageIndicatorVerticalPadding,
                      ),
                      child: PageIndicator(
                        controller: snapshot.data,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _fetchEmptyExpandedInfo() {
    final BuildContext context = _emptyExpandedKey.currentContext;

    final RenderBox containerRenderBox = context.findRenderObject();

    setState(() {
      _emptyExpandedSize = containerRenderBox.size;
      _emptyExpandedPosition = containerRenderBox.localToGlobal(Offset.zero);
    });
  }
}