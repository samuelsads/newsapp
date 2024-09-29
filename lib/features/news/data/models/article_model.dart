import 'package:newsapp/features/news/data/mappers/top_news_mapper.dart';
import 'package:newsapp/features/news/data/models/source_model.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';

///represents a article model
class ArticleModel extends Article {
  ///Constructs a [ArticleModel] with  the provided paraments.
  ArticleModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content,
      required this.sourceModel})
      : super(source: toSourceEntity(sourceModel));

  ///converts a json object to an [ArticleModel].
  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        sourceModel: SourceModel.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content'],
      );

  ///Represents the source model;
  final SourceModel sourceModel;
}
