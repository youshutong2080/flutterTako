import 'package:awesome/utils/widgetOnTap.dart';
import 'package:flutter/material.dart';


class ScreenImage extends StatelessWidget {
  final String assets;
  const ScreenImage({Key key, @required this.assets}) : super(key: key);

  initState() {
    print("assets");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: OnTapWidget(
        child: Image.asset(assets, fit: BoxFit.cover,width: width,),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}















