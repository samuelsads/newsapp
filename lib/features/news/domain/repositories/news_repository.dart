


import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';


///Abstract class representing a repository for news
abstract class NewsRepository{

  ///Get top news
  Future<Either<Failure, List<News>>> getTopNews();
}