import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_food_controller.dart';

class DetailFoodView extends GetView<DetailFoodController> {
  const DetailFoodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailFoodView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailFoodView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
