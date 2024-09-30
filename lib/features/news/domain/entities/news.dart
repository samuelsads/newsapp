import 'package:equatable/equatable.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';

///Represent a news
class News extends Equatable {
  ///Constructor of [News]
  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });


  ///Constructs to empity News
  const  News.empty(): this( status:'error', totalResults: 0, articles:const  []);

  ///Represent the status
  final String status;

  ///Represent total of results
  final int totalResults;

  ///Represent articles
  final List<Article> articles;

  @override
  List<Object?> get props => [status, totalResults, articles];
}
