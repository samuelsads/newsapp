import 'package:flutter/material.dart';
import 'package:newsapp/features/news/domain/entities/articles.dart';
import 'package:newsapp/utils/helpers/date_helper.dart';
import 'package:url_launcher/url_launcher.dart';

/// Class used to view article
class ArticlePage extends StatelessWidget {
  /// Constructor used to [ArticlePage]
  const ArticlePage({required this.article, super.key});

  /// Property used to handle by article by PathName
  static String pathName = 'article';

  /// Property used to handle by article by path
  static String path = 'article';

  /// Property to contain article
  final Article article;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      article.urlToImage,
                      fit: BoxFit.fill,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      article.description,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.start,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    article.author,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    DateHelper.formatDate(article.publishedAt),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(top: 24),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () async {
                                  launchUrl(Uri.parse(article.url));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .blue, // Cambia el color de fondo del botón
                                  padding: const EdgeInsets.symmetric(
                                      vertical:
                                          16), // Ajusta el padding si lo necesitas
                                ),
                                child: const Text(
                                  'More',
                                  style: TextStyle(color: Colors.white),
                                )))),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
