import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hura_test/core/resources/appbar/app_appbar.dart';

import '../controllers/user_controller.dart';

class AddUserView extends GetView<UserController> {
  const AddUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Create User'),
      body: const Center(
        child: Text(
          'AddUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
