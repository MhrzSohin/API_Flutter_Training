import 'package:api_app/app/core/config/api.dart';
import 'package:api_app/app/core/config/http_config.dart';
import 'package:api_app/app/data/model/emoji_response/emoji_response.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';
import 'package:api_app/app/data/model/stock_reponse.dart';
import 'package:flutter/scheduler.dart';

class RiddleService {
  static Future<RiddleResponse?> getRiddles() async {
    try {
      var res = await Api().get(
        HttpConfig.getRiddles,
      );
      var response =
          RiddleResponse.fromMap(res.data[0] as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }

  static Future<List<Emoji?>> getEmoji({
    required String name,
  }) async {
    try {
      var res = await Api().get(HttpConfig.getEmoji,
          addRequestInterceptor: true,
          queryParameters: {
            'name': name,
          });
      return (res.data as List<dynamic>?)
              ?.map((data) => Emoji.fromMap(data))
              .toList() ??
          [];
    } catch (err) {
      return [];
    }
  }

  static Future<StockReponse?> getStock() async {
    try {
      var res = await Api().get(
        HttpConfig.getStock,
      );
      var response = StockReponse.fromMap(res.data as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }
}
