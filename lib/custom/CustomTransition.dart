
import 'package:flutter/widgets.dart';

SlideTransition createTransition(Animation<double> animation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: Offset(1.0, 1.0),
      end: Offset(0, 0),
    ).animate(animation),
    child: child,
  );
}