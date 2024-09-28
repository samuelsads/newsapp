import 'package:go_router/go_router.dart';
import 'package:newsapp/features/news/presentation/pages/news_page.dart';


/// GoRouter Configuration
final appRouter = GoRouter(
    initialLocation: NewsPage.path,
    routes: [GoRoute(path: NewsPage.path, name: NewsPage.pathName)]);
