import 'package:api_app/app/core/config/api.dart';
import 'package:api_app/app/core/config/http_config.dart';
import 'package:api_app/app/data/model/movie_response/movie_response.dart';

class Movieservice {
  static Future<MovieResponse?> getMovies() async {
    try {
      var res = await Api().get(
        HttpConfig.movies,
        baseUrl: 'https://moviesapi.ir/api',
        queryParameters: {'page': 1},
        addRequestInterceptor: false,
      );
      var response = MovieResponse.fromMap(res.data as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }
}
