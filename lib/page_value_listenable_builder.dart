import 'dart:math';

import 'package:flutter/material.dart';

class PageValueListenableBuilder extends StatelessWidget {
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  final Widget oncedOlusturdugunuzWidget = const Text('Good job!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Value Listenable Builder Widget Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: _valueNotifier,
              builder: (context, randomSayi, widget) {
                return Column(
                  children: [
                    Center(),
                    Text(
                      "Ben stateless widget içinde çalışan dinamik bir birimim",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "$randomSayi",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _valueNotifier.value = Random().nextInt(1000);
                      },
                      child: Text("Rastgele Sayi Üret"),
                    ),
                  ],
                );
              },
              child: oncedOlusturdugunuzWidget,
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
                  "${_valueNotifier.value}",
                  style: Theme.of(context).textTheme.headline1,
                ),
                ElevatedButton(
                  onPressed: () {
                    _valueNotifier.value = Random().nextInt(1000);
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
