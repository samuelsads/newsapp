import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/configs/get_it/service_locator.dart';
import 'package:newsapp/features/news/presentation/blocs/top_news/top_news_bloc.dart';

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
          body: Placeholder(),
        ),
      );
}
