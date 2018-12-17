class NewsModel {
  List<_Result> _results = [];

  NewsModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['articles'].length);

    List<_Result> temp = [];

    for (int i = 0; i < parsedJson['articles'].length; i++) {
      _Result result = _Result(parsedJson['articles'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;
}

class _Result {
  String _author, _title, _description, _url, _urlToImage, _publishedAt;

  _Result(result) {
    _author = result['author'];
    _title = result['title'];
    _description = result['description'];
    _url = result['url'];
    _urlToImage = result['urlToImage'];
    _publishedAt = result['publishedAt'];
  }

  String get author => _author;

  String get title => _title;

  String get description => _description;

  String get url => _url;

  String get urlToImage => _urlToImage;

  String get publishedAt => _publishedAt;
}
