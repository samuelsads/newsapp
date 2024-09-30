part of 'top_news_bloc.dart';

///The state of the discover bloc
class TopNewsState extends Equatable {
  /// Constructor of [TopNewsState]
   TopNewsState(
      {this.requestProgressStatus = RequestProgressStatus.nothing,
      this.paginationProgressStatus = RequestProgressStatus.nothing,
      this.errorMessage = '',
      this.topNews, 
      this.isLoadingMore  = false,
      Pagination? pagination}): pagination=  pagination ?? Pagination.empty();

  ///The status of the pagination request
  final RequestProgressStatus paginationProgressStatus;

  ///The status of the topNews
  final RequestProgressStatus requestProgressStatus;

  ///The error Messsage
  final String errorMessage;

  ///The List of topNews
  final News? topNews;

  /// The bool loading more
  final bool isLoadingMore;

  ///The list of articles by [News]
  List<Article> get articles => topNews?.articles ?? [];

  ///The pagination data
   final Pagination pagination;

  ///Return a copy of the state with provided fields updated.
  TopNewsState copyWith(
          {RequestProgressStatus? requestProgressStatus,
          String? errorMessage,
          News? topNews,
          RequestProgressStatus? paginationProgressStatus, 
          bool? isLoadingMore,
          Pagination? pagination}) =>
      TopNewsState(
          requestProgressStatus:
              requestProgressStatus ?? this.requestProgressStatus,
          errorMessage: errorMessage ?? this.errorMessage,
          topNews: topNews ?? this.topNews,
          paginationProgressStatus:
              paginationProgressStatus ?? this.paginationProgressStatus, 
              pagination: pagination?? this.pagination,
              isLoadingMore: isLoadingMore?? this.isLoadingMore);

  @override
  List<Object?> get props =>
      [requestProgressStatus, errorMessage, topNews, paginationProgressStatus, pagination, isLoadingMore];
}
