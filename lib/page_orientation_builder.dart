import 'package:flutter/material.dart';

class PageOrientationdBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation Builder Widget Page"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(),
              Text(
                "Ekran Yönü",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "${orientation.index == 0 ? 'Dikey' : 'Yatay'}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          );
        },
      ),
    );
  }
}
