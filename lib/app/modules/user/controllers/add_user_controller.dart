import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hura_test/app/data/model/user.dart';
import 'package:hura_test/core/utils/toast/toast.dart';

import '../providers/user_provider.dart';

class AddUserController extends GetxController {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  final firstName = RxString('');
  final lastName = RxString('');
  var isAddUserLoading = RxBool(false);

  Future<void> clear() async {
    if (firstName.value.isNotEmpty || lastName.value.isNotEmpty) {
      displayWarningToast(Get.context!, 'All Field has been cleared');
    }
    firstNameC.clear();
    lastNameC.clear();
    firstName.value = '';
    lastName.value = '';
  }

  final UserProvider _userProvider = UserProvider();

  Future<void> createUser() async {
    if (firstName.value.isEmpty || lastName.value.isEmpty) {
      displayErrorToast(Get.context!, 'Please Complete All Fields ');
    } else {
      isAddUserLoading.value = true;
      final userData = {
        'first_name': firstName.value,
        'last_name': lastName.value,
      };
      final result = await _userProvider.createUser(userData);

      result.fold(
        (l) {
          // Handle error
          displayErrorToast(Get.context!, l.message);
          isAddUserLoading.value = false;
        },
        (r) {
          // Handle success
          displaySuccessToast(Get.context!, 'User created successfully');
          isAddUserLoading.value = false;
          clear();
        },
      );
    }
  }
}
