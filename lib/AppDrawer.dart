import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              child: Text(
            'NewsApp',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),

          )),
          ListTile(
            title: Text('Business News'),
            leading: Icon(Icons.business),
            onTap: (){
              print('BUSINESS NEWS');
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
                  content: new Text("Selected Item "),
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
        ],
      ),
    );
  }

//_AppDrawerState createState() => _AppDrawerState();
}
