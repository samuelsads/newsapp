import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsapp/features/news/data/datasources/news_api_datasource.dart';
import 'package:newsapp/features/news/data/mappers/top_news_mapper.dart';
import 'package:newsapp/features/news/data/models/news_model.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/utils/enums/request_type.dart';
import 'package:newsapp/utils/helpers/http_client_helper.dart';

///Implementation of [NewsApiDatasource]
class NewsApiDatasourceImpl implements NewsApiDatasource {
  /// Construcs a [NewsApiDatasourceImpl] with the provided [httpClientHelper]
  NewsApiDatasourceImpl({required this.client});

  ///Instance of [HttpClientHelper] used to make HTTP requests.
  final HttpClientHelper client;

  @override
  Future<News> getTopNews({int page = 1}) async {
    final String token = dotenv.env['API_KEY']!;
    try {
      final response = await client.request(
          endpoint:
              '/top-headlines?apiKey=$token&pageSize=10&country=us&page=$page',
          requestType: RequestType.get);

      final model = NewsModel.fromJson(response.data);
      return toNewsEntity(model);
    } on Exception {
      rethrow;
    }
  }
}
