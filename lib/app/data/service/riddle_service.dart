import 'package:api_app/app/core/config/api.dart';
import 'package:api_app/app/core/config/http_config.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';

class RiddleService {
  static Future<RiddleResponse?> getRiddles() async {
    try {
      var res = await Api().get(
        HttpConfig.getRiddles,
        addAuthInterceptor: true, //no need for this project
        addRequestInterceptor: true, //no need for this project
      );
      var response = RiddleResponse.fromMap(res.data as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }
}
