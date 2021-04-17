import 'dart:math';

import 'package:flutter/material.dart';

class PageStatefulBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int randomSayi = 0;
    return Scaffold(
      appBar: AppBar(
        // https://stackoverflow.com/a/57240941/6378949
        title: Text("Stateful Builder Widget Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StatefulBuilder(
              builder: (context, setstate) {
                return Column(
                  children: [
                    Center(),
                    Text(
                      "Ben stateless widget içinde çalışan stateful birimiyim",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "$randomSayi",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        randomSayi = Random().nextInt(1000);
                        setstate(() {});
                      },
                      child: Text("Rastgele Sayi Üret"),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Ben stateless widget içindeki normal bir birimim",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "$randomSayi",
                  style: Theme.of(context).textTheme.headline1,
                ),
                ElevatedButton(
                  onPressed: () {
                    randomSayi = Random().nextInt(1000);
                    // setstate(() {});
                  },
                  child: Text("Rastgele Sayi Üret"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
