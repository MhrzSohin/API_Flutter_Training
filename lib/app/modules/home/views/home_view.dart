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
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                controller.riddlResults.value.data?.question.toString() ??
                    'wait',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.title.value = 'abc value';

                  controller.fetchData();
                },
                child: const Text('Fetch data')),
            Obx(
              () => Text(
                controller.emojiResult.value.data?.firstOrNull?.character ??
                    'waiting..',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.title.value = 'Emoji Loading';

                  controller.fetchEmoji();
                },
                child: const Text('Fetch data')),
          ],
        ),
      ),
    );
  }
}
