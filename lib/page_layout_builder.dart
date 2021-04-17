import 'package:flutter/material.dart';

class PageLayoutBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder Widget Page"),
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.lightGreenAccent.shade100,
        padding: EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: Colors.red.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pembe kutu genişliği: ${constraints.maxWidth}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "Pembe kutu yüksekliği: ${constraints.maxHeight}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
