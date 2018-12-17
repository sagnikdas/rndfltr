import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: GridView.builder(
          itemCount: 20,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
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
                          color: Colors.green,
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
            );
          },
        ),
      ),
    );
  }
}
