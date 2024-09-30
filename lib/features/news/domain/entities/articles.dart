import 'package:equatable/equatable.dart';
import 'package:newsapp/features/news/domain/entities/sources.dart';

///Represents an Article
class Article extends Equatable {
  ///Construcs an [Article]
  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  /// The source of article
  final Source source;

  /// The author of article
  final String author;

  /// The title of article
  final String title;

  /// The description of article
  final String description;

  ///The url of article
  final String url;

  ///The urlToImage of article
  final String urlToImage;

  ///The publishedAt of article
  final DateTime publishedAt;

  ///The content of article
  final String content;

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}
