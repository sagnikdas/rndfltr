import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/news_model.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = '8c64f066dcc64c1dbe40e8b1e02121b9';

  Future<NewsModel> fetchNewsList() async {
    print('entered');
    final response = await client.get(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apiKey");

    if(response.statusCode == 200){
      return NewsModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}
