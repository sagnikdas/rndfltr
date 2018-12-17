import 'dart:async';
import '../resources/news_api_provider.dart';
import '../models/news_model.dart';

class Repository {
  final newsApiProvider = NewsApiProvider();

  Future<NewsModel> fetchAllNews() => newsApiProvider.fetchNewsList();
}
