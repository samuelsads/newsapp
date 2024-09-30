import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';
import 'package:newsapp/features/news/presentation/pages/article_page.dart';
import 'package:newsapp/features/news/presentation/pages/news_page.dart';

/// GoRouter Configuration
final appRouter = GoRouter(initialLocation: NewsPage.path, routes: [
  GoRoute(
      path: NewsPage.path,
      name: NewsPage.pathName,
      builder: (context, state) => const NewsPage(),
      routes: [
        GoRoute(
          path: ArticlePage.path,
          name: ArticlePage.pathName,
          pageBuilder: (context, state) {
            final Article data = state.extra as Article;
            return MaterialPage(child: ArticlePage(article: data));
          },
        )
      ])
]);
