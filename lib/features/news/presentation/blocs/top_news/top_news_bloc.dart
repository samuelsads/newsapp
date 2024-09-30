import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/usecases/load_top_news.dart'
    as load_top_news;
import 'package:newsapp/utils/enums/request_progress_status.dart';
import 'package:newsapp/utils/helpers/failure_helper.dart';

import 'package:newsapp/core/domains/entities/pagination.dart';

part 'top_news_event.dart';
part 'top_news_state.dart';

///A bloc that handles the top new widget state
class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  /// Creates an instance of [TopNewsBloc]
  TopNewsBloc({required this.loadTopNews}) : super(TopNewsState()) {
    on<LoadTopNewsEvent>(_onLoadTopNewsEvent);
    on<LoadNextNewsEvent>(_onLoadNextTopNewsEvent);
  }

  /// The use case for loading top news.
  final load_top_news.LoadTopNews loadTopNews;

  Future<void> _onLoadNextTopNewsEvent(
      LoadNextNewsEvent event, Emitter<TopNewsState> emit) async {
    if (state.pagination.isLoadMoreRunning) return;

    if (state.pagination.hasNextPage &&
        !state.pagination.isFirstLoadingRunning &&
        !state.pagination.isLoadMoreRunning) {
      emit(state.copyWith(
          pagination: Pagination(
              currentPage: state.pagination.currentPage + 1,
              hasNextPage: state.pagination.hasNextPage,
              isFirstLoadingRunning: state.pagination.isFirstLoadingRunning,
              isLoadMoreRunning: true)));
      final response = await loadTopNews(
          load_top_news.Params(page: state.pagination.currentPage));
      

      response.fold((failure)async {
          emit(state.copyWith(
            errorMessage: mapFailureToMessage(failure),
            pagination: Pagination(
              currentPage: state.pagination.currentPage -1,)));
      }, (news)async {
          final articles  = List<Article>.from(state.topNews?.articles??[])..addAll(news.articles);
          

          emit(state.copyWith(
            topNews: News(status: state.topNews?.status??'', totalResults: state.topNews?.totalResults??0, articles: articles),
            pagination: Pagination(
              currentPage: state.pagination.currentPage,
              hasNextPage: (news.articles.isNotEmpty)? true: false,
              isFirstLoadingRunning: state.pagination.isFirstLoadingRunning)
          ));
      },);
    }
  }

  Future<void> _onLoadTopNewsEvent(
      LoadTopNewsEvent event, Emitter<TopNewsState> emit) async {
    emit(state.copyWith(requestProgressStatus: RequestProgressStatus.loading));

    final response = await loadTopNews(const load_top_news.Params());

    response.fold(
      (failure) async {
        emit(state.copyWith(
          pagination: Pagination(),
            requestProgressStatus: RequestProgressStatus.error,
            errorMessage: mapFailureToMessage(failure)));
      },
      (topNews) async {
        emit(state.copyWith(
          pagination: Pagination(),
            requestProgressStatus: RequestProgressStatus.success,
            topNews: topNews));
      },
    );
  }
}
