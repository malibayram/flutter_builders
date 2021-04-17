import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Builder Widget Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(),
            if (_error.length > 0)
              Text(
                "Hata Oluştu!",
                style: Theme.of(context).textTheme.headline1,
              ),
            SelectableText(
              _error,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Spacer(),
          ElevatedButton(
            child: Text("Builder Dışında"),
            onPressed: () {
              try {
                Scaffold.of(context).openEndDrawer();
              } catch (e) {
                _error = e.toString();
                setState(() {});
              }
            },
          ),
          SizedBox(width: 12.0),
          Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                child: Text("Builder İçinde"),
                onPressed: () {
                  _error = "";
                  setState(() {});
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
// https://stackoverflow.com/a/52123080
