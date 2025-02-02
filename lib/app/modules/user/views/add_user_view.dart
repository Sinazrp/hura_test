import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class AddUserView extends GetView<UserController> {
  const AddUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
