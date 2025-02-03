import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hura_test/core/utils/toast/toast.dart';

import '../providers/user_provider.dart';

class UserController extends GetxController {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  final firstName = RxString('');
  final lastName = RxString('');
  var isLoading = RxBool(false);
  Future<void> clear() async {
    firstNameC.clear();
    lastNameC.clear();
    firstName.value = '';
    lastName.value = '';
  }

  final UserProvider _userProvider = UserProvider();

  Future<void> createUser(BuildContext context) async {
    isLoading.value = true;
    final userData = {
      'first_name': firstName.value,
      'last_name': lastName.value,
    };
    final result = await _userProvider.createUser(userData);

    result.fold(
      (l) {
        // Handle error
        displayErrorToast(context, l.message);
        isLoading.value = false;
      },
      (r) {
        // Handle success
        displaySuccessToast(context, 'User created successfully');
        isLoading.value = false;
        clear();
      },
    );
  }
}
