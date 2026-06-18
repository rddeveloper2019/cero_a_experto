import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.get('THE_MOVIEDB_API_KEY', fallback: 'Invalid apiKey');
  static String apiReadAccessToken = dotenv.get(
    'THE_MOVIEDB_API_READ_ACCESS_TOKEN',
    fallback: 'Invalid apiReadAccessToken',
  );
  static String accountId = dotenv.get('THE_MOVIEDB_ACCOUNT_ID', fallback: 'Invalid accountId');
}
