import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PageStreamBuilder extends StatefulWidget {
  @override
  _PageStreamBuilderState createState() => _PageStreamBuilderState();
}

class _PageStreamBuilderState extends State<PageStreamBuilder> {
  final StreamController<List<int>> _streamController =
      StreamController<List<int>>();
  List<int> _saniyeler;

  Future<void> _basla() async {
    _saniyeler = [];
    for (int i = 0; i < 25; i++) {
      int beklemeSaniye = Random().nextInt(5);
      await Future.delayed(Duration(seconds: beklemeSaniye));
      _saniyeler.add(beklemeSaniye);
      _streamController.add(_saniyeler);
    }
  }

  @override
  void initState() {
    _basla();

    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder Widget Page"),
      ),
      body: Center(
        child: StreamBuilder<List<int>>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                reverse: true,
                itemCount: _saniyeler.length,
                itemBuilder: (c, i) {
                  return Row(
                    children: [
                      if (_saniyeler.reversed.toList()[i] % 2 == 0) Spacer(),
                      Card(
                        child: Text(
                          "Ben ${_saniyeler.reversed.toList()[i]} saniye sonra oluştum",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      if (_saniyeler.reversed.toList()[i] % 2 != 0) Spacer(),
                    ],
                  );
                },
              );
            if (snapshot.hasError)
              return Text(
                "${snapshot.error}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Şu anda stream'den değer gelmesini bekliyorum",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
