import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/features/news/data/datasources/news_api_datasource.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/utils/helpers/failure_helper.dart';

///Implementation of [NewsRepository]
class NewsRepositoryImpl implements NewsRepository {
  ///Constructor for [NewsRepositoryImpl]
  NewsRepositoryImpl({required this.datasource});

  ///The remote datasource for news
  final NewsApiDatasource datasource;

  @override
  Future<Either<Failure, News>> getTopNews({int page = 1}) async {
    try {
      final news = await datasource.getTopNews(page: page);
      return Right(news);
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
