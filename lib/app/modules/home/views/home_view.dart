import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    controller.title.value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isAnswerVisible.value,
                    child: Text(
                      controller.riddlResults.value.data?.answer ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.title.value;
                          controller.isAnswerVisible.value = false;
                          controller.fetchData();
                        },
                        child: const Text('Fetch data')),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.isAnswerVisible.value =
                              !controller.isAnswerVisible.value;
                        },
                        child: Text("Show Answer")),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: controller.emoji,
                  decoration: InputDecoration(
                    hintText: "Enter the emoji",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.fetchEmoji();
                    },
                    child: Text("Show Emoji")),
                Obx(
                  () => Image.network(
                    controller.emojiResult.value.data?.firstOrNull?.image ?? "",
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // TextFormField(
                //   controller: controller.stock,
                //   decoration: InputDecoration(
                //     hintText: "Enter the stock",
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(4)),
                //   ),
                // ),
                Obx(
                  () => Text(
                    controller.stockdata.value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.stockdata.value;
                          controller.fetchStock();
                        },
                        child: const Text('Fetch stock')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
