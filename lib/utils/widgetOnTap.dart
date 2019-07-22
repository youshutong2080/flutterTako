
import 'package:flutter/material.dart';

class OnTapWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;

  OnTapWidget({Key key, this.child, this.onTap}) : super(key: key);

  _OnTapWidgetState createState() => _OnTapWidgetState();
}

class _OnTapWidgetState extends State<OnTapWidget> {
  var isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(microseconds: 700),
        foregroundDecoration: BoxDecoration(
          color: isDown ? Colors.white.withOpacity(0.5) : Colors.transparent
        ),
        child: widget.child,
      ),
      onTap: widget.onTap,
      onTapDown: (d) => setState(() => isDown = true),
      onTapUp: (d) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
    );
  }
}




