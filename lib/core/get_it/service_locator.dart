import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/core/dio/dio_config.dart';
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
}
