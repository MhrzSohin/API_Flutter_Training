import 'package:api_app/app/data/model/emoji_response/emoji_response.dart';
import 'package:api_app/app/data/model/movie_response/movie_response.dart';
import 'package:api_app/app/data/model/result.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';
import 'package:api_app/app/data/model/stock_reponse.dart';
import 'package:api_app/app/data/service/movieservice.dart';
import 'package:api_app/app/data/service/riddle_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  var title = 'Home'.obs;
  var stockdata = "stock list".obs;
  var emoji = TextEditingController();
  var stock = TextEditingController();
  var dataBox = GetStorage();
  var isAnswerVisible = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title.value = dataBox.read('riddle') ?? 'no data';
  }

  @override
  void onReady() async {
    super.onReady();

    Get.showOverlay(
      asyncFunction: () async {
        await fetchMovie();
      },
      loadingWidget: Center(
        child: CupertinoActivityIndicator(
          radius: 20.0, // Customize the size if needed
        ),
      ),
    );
  }

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
      title.value = riddlResults.value.data?.question ?? 'no data';
      dataBox.write('riddle', riddlResults.value.data?.question);
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

    var response = await RiddleService.getEmoji(name: emoji.text);
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

  var stockResult = APIResult<StockReponse>().obs;
  void fetchStock() async {
    stockResult.value = APIResult.loading();

    var response = await RiddleService.getStock();
    if (response != null) {
      stockResult.value = APIResult.success(response);
    } else {
      stockResult.value = APIResult.error("Something went wrong.");
    }
    if (stockResult.value.isSuccessful) {
      stockdata.value = stockResult.value.data?.name ?? 'no data';
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }

  var movieResult = APIResult<MovieResponse>().obs;
  Future<void> fetchMovie() async {
    movieResult.value = APIResult.loading();

    var response = await Movieservice.getMovies();
    if (response != null) {
      movieResult.value = APIResult.success(response);
    } else {
      movieResult.value = APIResult.error("Something went wrong.");
    }
    if (movieResult.value.isSuccessful) {
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }
}
