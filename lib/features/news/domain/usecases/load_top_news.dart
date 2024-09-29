import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp/core/domains/usecases/usecase.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

/// A use case that load top news with  pagination
class LoadTopNews implements UseCase<void, Params> {
  /// Constructor for [LoadTopNews] use case.
  LoadTopNews({required this.repository});

  ///The repository for news
  final NewsRepository repository;

  @override
  Future<Either<Failure, News>> call(Params params) =>
      repository.getTopNews(page: params.page);
}

///PArams for [LoadTopNews] usecase
class Params extends Equatable {
  ///Constructor for Params.
  const Params({this.page = 1});

  /// The page number to load.
  final int page;

  @override
  List<Object?> get props => [page];
}
