import 'package:flutter/material.dart';

class PageTweenAnimationBuilder extends StatefulWidget {
  @override
  _PageTweenAnimationBuilderState createState() =>
      _PageTweenAnimationBuilderState();
}

class _PageTweenAnimationBuilderState extends State<PageTweenAnimationBuilder> {
  double hedefBoyut = 224.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation Builder Widget Page"),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          curve: Curves.bounceInOut,
          tween: Tween<double>(begin: 0, end: hedefBoyut),
          duration: const Duration(seconds: 5),
          builder: (BuildContext context, double size, Widget child) {
            return IconButton(
              iconSize: size,
              color: Colors.blue,
              icon: child,
              onPressed: () {
                hedefBoyut = hedefBoyut == 224.0 ? 24.0 : 224.0;
                setState(() {});
              },
            );
          },
          child: const Icon(Icons.alarm),
        ),
      ),
    );
  }
}
