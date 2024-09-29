import 'package:newsapp/features/news/domain/entities/news.dart';

///Abstract class representing  a datasource for News.
abstract class NewsApiDatasource {
  /// Gets top News
  Future<News> getTopNews({int page  = 1});
}
