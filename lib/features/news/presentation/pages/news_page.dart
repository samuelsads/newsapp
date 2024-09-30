import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/configs/get_it/service_locator.dart';
import 'package:newsapp/core/presentation/widgets/error_widget.dart';
import 'package:newsapp/features/news/presentation/blocs/top_news/top_news_bloc.dart';
import 'package:newsapp/utils/enums/request_progress_status.dart';

/// Class used to view news
class NewsPage extends StatelessWidget {
  /// Class use tu view news
  const NewsPage({super.key});

  /// Property used to handle by routing by PathName
  static String pathName = 'news-page';

  /// Property used to handle by routing by path
  static String path = '/news-page';

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: serviceLocator<TopNewsBloc>()..add(const LoadTopNewsEvent()),
        child: const Scaffold(
          body: NewsView(),
        ),
      );
}

///Class used to ilustrate news page
class NewsView extends StatefulWidget {
  /// Creates an instance of [NewsView]
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

///Controller to pagination
late ScrollController _controller;

class _NewsViewState extends State<NewsView> {
  ///Event lo load more top news
  Future<void> _loadMore() async {
    context.read<TopNewsBloc>().add(const LoadNextNewsEvent());
  }

  @override
  void initState() {
    _controller = ScrollController()..addListener(_loadMore);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () {
          context.read<TopNewsBloc>().add(const LoadTopNewsEvent());
          return Future<void>.delayed(const Duration(seconds: 1), () => null);
        },
        child: BlocConsumer<TopNewsBloc, TopNewsState>(
          listener: (context, state) {
            if (state.requestProgressStatus.isError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                showCloseIcon: true,
                closeIconColor: const Color(0xFF939598),
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFFFFF5F5),
                content: Row(
                  children: [
                    const Icon(Icons.error, color: Color(0xFFB3261E)),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        state.errorMessage,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ));
            }
          },
          builder: (context, state) {
            if (state.requestProgressStatus.isLoading) return const Center(child: CircularProgressIndicator());
            if (state.requestProgressStatus.isError) {
              return GlobalErrorWidget(
                title: 'An error ocurred while loading news. Please try again',
                onPressed: () {
                  context.read<TopNewsBloc>().add(const LoadTopNewsEvent());
                },
              );
            }

            final articles = state.topNews?.articles ?? [];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Text(
                            'Tops News',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          )),
                      Expanded(
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 24),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(article.author.isNotEmpty
                                              ? article.source.name
                                              : 'S/N'),
                                          Text(
                                            article.description.isNotEmpty
                                                ? article.description
                                                : 'S/N',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        article.urlToImage,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                          Icons.image,
                                          size: 80,
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.pagination.isLoadMoreRunning)
                  Positioned(
                      bottom: 10,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:
                              const Center(child: CircularProgressIndicator())))
              ],
            );
          },
        ),
      );
}
