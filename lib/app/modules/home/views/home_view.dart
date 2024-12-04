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
                controller.riddlResults.value.data?.title.toString() ?? 'wait',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.title.value = 'abc value';

                  controller.fetchData();
                },
                child: Text('Fetch data'))
          ],
        ),
      ),
    );
  }
}
