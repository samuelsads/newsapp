import 'package:equatable/equatable.dart';

/// Represents the pagination info.
// ignore: must_be_immutable
class Pagination extends Equatable {
  /// Constructs a [Pagination].
  Pagination({
     this.hasNextPage = true,
     this.isFirstLoadingRunning = false,
     this.isLoadMoreRunning = false,
     this.wait = false,
     this.currentPage  =1
  });

  /// Constructs an empty [Pagination].
   Pagination.empty()
      : this(
          hasNextPage: true,
          isFirstLoadingRunning: false,
          isLoadMoreRunning: false,
          wait: false,
          currentPage: 1
        );


  ///The current page
  int currentPage;

  ///The bool to has next page;
   bool hasNextPage;

  ///The bool to is firstLoading
   bool isFirstLoadingRunning;

  ///The bool to is load more running
   bool  isLoadMoreRunning;

  ///The bool to load only one time
   bool wait;

  @override
  List<Object?> get props => [
      hasNextPage, isFirstLoadingRunning, isLoadMoreRunning, wait
      ];
}
