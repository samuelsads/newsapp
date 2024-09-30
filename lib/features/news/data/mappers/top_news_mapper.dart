import 'package:newsapp/features/news/data/models/article_model.dart';
import 'package:newsapp/features/news/data/models/source_model.dart';
import 'package:newsapp/features/news/data/models/news_model.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/entities/sources.dart';

///Convert [NewsModel] to [News]
News toNewsEntity(NewsModel model) => News(
    status: model.status,
    totalResults: model.totalResults,
    articles: model.articles);

///Convert a list of [ArticleModel] to a list of [Article]
List<Article> toArticleEntityList(List<ArticleModel> models) =>
    models.map(toArticleEntity).toList();

///Convert [ArticleModel] to [Article]
Article toArticleEntity(Article model) => Article(
    source: model.source,
    author: model.author,
    title: model.title,
    description: model.description,
    url: model.url,
    urlToImage: model.urlToImage,
    publishedAt: model.publishedAt,
    content: model.content);

///Convert [SourceModel] to [Source]
Source toSourceEntity(SourceModel model) =>
    Source(id: model.id, name: model.name);
