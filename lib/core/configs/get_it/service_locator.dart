import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/core/configs/dio/dio_config.dart';
import 'package:newsapp/features/news/data/datasources/news_api_datasource.dart';
import 'package:newsapp/features/news/data/datasources/news_api_datasource_impl.dart';
import 'package:newsapp/features/news/data/repositories/news_repository_impl.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/features/news/domain/usecases/load_top_news.dart';
import 'package:newsapp/features/news/presentation/blocs/top_news/top_news_bloc.dart';
import 'package:newsapp/utils/helpers/http_client_helper.dart';

/// Global service locator instance for dependency injection.
final serviceLocator = GetIt.instance;

/// Sets up the service locator for dependency injection.
///
/// This function initializes the global service locator instance and can be called
/// to register dependencies before they are needed throughout the application.
void setUpServiceLocator() {
  serviceLocator.registerSingleton<Dio>(dioConfig);
  serviceLocator.registerSingleton<HttpClientHelper>(
    HttpClientHelperImpl(serviceLocator<Dio>()),
  );

  //MARK: FEATURE: NEWS

  //Data sources
  serviceLocator.registerSingleton<NewsApiDatasource>(
    NewsApiDatasourceImpl(client: serviceLocator<HttpClientHelper>())
  );

  //Repositories
  serviceLocator.registerSingleton<NewsRepository>(
    NewsRepositoryImpl(datasource: serviceLocator<NewsApiDatasource>())
  );

  //Use cases
  serviceLocator.registerSingleton<LoadTopNews>(
    LoadTopNews(repository: serviceLocator<NewsRepository>())
  );

  //Bloc
  serviceLocator.registerSingleton(
    TopNewsBloc(loadTopNews: serviceLocator<LoadTopNews>())
  );

}
