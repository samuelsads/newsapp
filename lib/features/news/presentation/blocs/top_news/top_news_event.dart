part of 'top_news_bloc.dart';


///The events for the [TopNewsEvent]
sealed class TopNewsEvent extends Equatable {
  const TopNewsEvent();
}

/// Event used to fetch topNews
class LoadTopNewsEvent extends TopNewsEvent{

  /// Constructs a [LoadTopNewsEvent]
  const LoadTopNewsEvent();

  @override
  List<Object?> get props => [];
}
