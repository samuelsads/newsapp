import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/usecases/load_top_news.dart'
    as load_top_news;
import 'package:newsapp/utils/enums/request_progress_status.dart';
import 'package:newsapp/utils/helpers/failure_helper.dart';

part 'top_news_event.dart';
part 'top_news_state.dart';


///A bloc that handles the top new widget state
class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {

  /// Creates an instance of [TopNewsBloc]
  TopNewsBloc({required this.loadTopNews}) : super(const TopNewsState()) {
    on<LoadTopNewsEvent>(_onLoadTopNewsEvent);
  }

  /// The use case for loading top news.
  final load_top_news.LoadTopNews loadTopNews;

  Future<void> _onLoadTopNewsEvent(
      LoadTopNewsEvent event, Emitter<TopNewsState> emit) async {
    emit(state.copyWith(requestProgressStatus: RequestProgressStatus.loading));

    final response = await loadTopNews(const load_top_news.Params());

    response.fold(
      (failure) async {
        emit(state.copyWith(
            requestProgressStatus: RequestProgressStatus.error,
            errorMessage: mapFailureToMessage(failure)));
      },
      (topNews) async {
        emit(state.copyWith(
            requestProgressStatus: RequestProgressStatus.success,
            topNews: topNews));
      },
    );
  }
}
