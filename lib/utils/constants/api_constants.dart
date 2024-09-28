

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Base URL for API requests.
String baseUrl = dotenv.env['API_URL']!;

/// API key for accessing endpoints.
String apiKey = dotenv.env['API_KEY']!;