import 'dart:math';

import 'package:flutter/material.dart';

class PageFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder Widget Page"),
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: Future<int>.microtask(
            () async {
              int beklemeSaniye = Random().nextInt(10);
              await Future.delayed(Duration(seconds: beklemeSaniye));
              if (beklemeSaniye > 4)
                throw "Ben widget oluştuktan $beklemeSaniye saniye sonra oluşan hata mesajıyım";

              if (beklemeSaniye < 2) return null;
              return beklemeSaniye;
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Text(
                "Ben widget oluştuktan ${snapshot.data} saniye sonra oluştum",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              );
            if (snapshot.hasError)
              return Text(
                "${snapshot.error}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              );
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData)
              return Text(
                "Herhangi bir değer döndürmeyen future fonksiyonların bitmesini de; 'snapshot.connectionState == ConnectionState.done' şeklinde bekleyebiliriz",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Şu anda future fonksiyonun bitmesini bekliyorum",
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
