  import 'package:flutter/material.dart';
  import 'package:meta/meta.dart';
  import 'model/menu.dart';


  const double _kFlingVelocity = 2.0;

  class Backdrop extends StatefulWidget {
    final Menu currentMenu;
    final Widget frontLayer;
    final Widget backLayer;
    final Widget frontTitle;
    final Widget backTitle;
    final Widget configLayer;

    const Backdrop({
      @required this.currentMenu,
      @required this.frontLayer,
      @required this.backLayer,
      @required this.frontTitle,
      @required this.backTitle,
      @required this.configLayer,
    })  : assert(currentMenu != null),
          assert(frontLayer != null),
          assert(backLayer != null),
          assert(frontTitle != null),
          assert(backTitle != null),
          assert(configLayer != null);

    @override
    _BackdropState createState() => _BackdropState();
  }

  class _BackdropState extends State<Backdrop>
      with SingleTickerProviderStateMixin {
    final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

    AnimationController _controller;

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        duration: Duration(milliseconds: 300),
        value: 1.0,
        vsync: this,
      );
    }

    @override
    void didUpdateWidget(Backdrop old) {
      super.didUpdateWidget(old);

      if (widget.currentMenu != old.currentMenu) {
        _toggleBackdropLayerVisibility();
      } else if (!_frontLayerVisible) {
        _controller.fling(velocity: _kFlingVelocity);
      }
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    bool get _frontLayerVisible {
      final AnimationStatus status = _controller.status;
      return status == AnimationStatus.completed ||
          status == AnimationStatus.forward;
    }

    void _toggleBackdropLayerVisibility() {
      _controller.fling(
          velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);
    }

    Widget _buildStack(BuildContext context, BoxConstraints constraints) {
      const double layerTitleHeight = 48.0;
      final Size layerSize = constraints.biggest;
      final double layerTop = layerSize.height - layerTitleHeight;

      // TODO: Create a RelativeRectTween Animation (104)
      Animation<RelativeRect> layerAnimation = RelativeRectTween(
        begin: RelativeRect.fromLTRB(
            0.0, layerTop, 0.0, layerTop - layerSize.height),
        end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      ).animate(_controller.view);

      return Stack(
        key: _backdropKey,
        children: <Widget>[
          ExcludeSemantics(
            child: widget.backLayer,
            excluding: _frontLayerVisible,
          ),
          PositionedTransition(
            rect: layerAnimation,
            child: _FrontLayer(
              onTap: _toggleBackdropLayerVisibility,
              child: widget.frontLayer,
            ),
          ),
        ],
      );
    }

    @override
    Widget build(BuildContext context) {
      var appBar = AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _toggleBackdropLayerVisibility,
        ),
        title: widget.frontTitle,
        actions: <Widget>[
          widget.configLayer,
        ],
      );
      return Scaffold(
        appBar: appBar,
        body: LayoutBuilder(builder: _buildStack),
      );
    }
  }

  class _FrontLayer extends StatelessWidget {
    const _FrontLayer({
      Key key,
      this.onTap,
      this.child,
    }) : super(key: key);

    final VoidCallback onTap;
    final Widget child;

    @override
    Widget build(BuildContext context) {
      return Material(
        elevation: 16.0,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Container(
                height: 40.0,
                alignment: AlignmentDirectional.centerStart,
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      );
    }
  }