import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/news_model.dart';
import '../blocs/news_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllNews();
    return Scaffold(
      appBar: AppBar(
        title: Text('News Daily'),
      ),
      body: StreamBuilder(
        stream: bloc.allNews,
        builder: (context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<NewsModel> snapshot) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${snapshot.data.results[index].title}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${snapshot.data.results[index].description}'),
              )
            ],
          ),
          elevation: 5.0,
        );
      },
      itemCount: snapshot.data.results.length,
    );

    /*GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  '${snapshot.data.results[index].urlToImage}',
                  fit: BoxFit.scaleDown,
                ),
                Center(child: Text('${snapshot.data.results[index].title}')),
              ],
            ),
          );
        });*/
  }
}
