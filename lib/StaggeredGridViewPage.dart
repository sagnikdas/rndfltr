import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) => new GestureDetector(
        child: Card(
          elevation: 5.0,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              style: BorderStyle.solid,
            ),
            gapPadding: 8.0,
          ),
          child: new Container(
            alignment: Alignment.center,
            child: new Text('Item $index'),
          ),
        ),
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            child: new CupertinoAlertDialog(
              title: new Column(
                children: <Widget>[
                  new Text("GridView"),
                  new Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
              content: new Text("Selected Item $index"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"))
              ],
            ),
          );
        },
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
