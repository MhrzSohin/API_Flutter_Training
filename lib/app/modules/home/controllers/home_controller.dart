import 'package:api_app/app/data/model/emoji_response/emoji_response.dart';
import 'package:api_app/app/data/model/result.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';
import 'package:api_app/app/data/service/riddle_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  var title = 'Home'.obs;

  var riddlResults = APIResult<RiddleResponse>().obs;
  // final dio = Dio();

  void fetchData() async {
    riddlResults.value = APIResult.loading();

    var response = await RiddleService.getRiddles();
    if (response != null) {
      riddlResults.value = APIResult.success(response);
    } else {
      riddlResults.value = APIResult.error("Something went wrong.");
    }
    if (riddlResults.value.isSuccessful) {
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }

    // var response = await dio.get(
    //   'https://api.api-ninjas.com/v1/riddles',
    //   options: Options(
    //     headers: {'X-Api-Key': '1wDtvZuDeIn+MyJkLZp12g==zU8rGfoGQv54ePeW'},
    //   ),
    // );
    // title.value = response.data[0]['question'];
  }

  var emojiResult = APIResult<List<Emoji?>>().obs;
  void fetchEmoji() async {
    emojiResult.value = APIResult.loading();

    var response = await RiddleService.getEmoji(name: 'angry');
    if (response.isNotEmpty) {
      emojiResult.value = APIResult.success(response);
    } else {
      emojiResult.value = APIResult.error("Something went wrong.");
    }
    if (emojiResult.value.isSuccessful) {
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }
}
