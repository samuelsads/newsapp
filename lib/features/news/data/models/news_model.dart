import 'package:newsapp/features/news/data/mappers/top_news_mapper.dart';
import 'package:newsapp/features/news/data/models/article_model.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

///TopNewsModel
class NewsModel extends News {
  ///TopNewsModel constructor
  NewsModel(
      {required super.status,
      required super.totalResults,
      required this.articlesModel})
      : super(articles: toArticleEntityList(articlesModel));

  /// Converts a json object into a [TopNewsModel]
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articlesModel: 
            // ignore: unnecessary_lambdas
            (json['articles'] as List).map<ArticleModel>((articles) => ArticleModel.fromJson(articles)).toList(),
      );

  /// Convert a [ArticleModel] to a json object
  final List<ArticleModel> articlesModel;
}
