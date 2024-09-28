import 'package:flutter/material.dart';


/// Class used to view news
class NewsPage extends StatelessWidget {

  /// Class use tu view news
  const NewsPage({super.key});



  /// Property used to handle by routing by PathName
  static String pathName = 'news-page';


  /// Property used to handle by routing by path
  static String path  = '/news-page';

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Placeholder(),
    );
}