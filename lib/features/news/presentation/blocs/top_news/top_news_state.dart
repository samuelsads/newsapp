part of 'top_news_bloc.dart';

///The state of the discover bloc
class TopNewsState extends Equatable {
  /// Constructor of [TopNewsState]
  const TopNewsState(
      {this.requestProgressStatus = RequestProgressStatus.nothing,
      this.errorMessage = '',
      this.topNews});

  ///The status of the topNews
  final RequestProgressStatus requestProgressStatus;

  ///The error Messsage
  final String errorMessage;

  ///The List of topNews
  final News? topNews;

  ///Return a copy of the state with provided fields updated.
  TopNewsState copyWith(
          {RequestProgressStatus? requestProgressStatus,
          String? errorMessage,
          News? topNews}) =>
      TopNewsState(
          requestProgressStatus:
              requestProgressStatus ?? this.requestProgressStatus,
          errorMessage: errorMessage ?? this.errorMessage,
          topNews: topNews ?? this.topNews);

  @override
  List<Object?> get props => [requestProgressStatus, errorMessage, topNews];
}
