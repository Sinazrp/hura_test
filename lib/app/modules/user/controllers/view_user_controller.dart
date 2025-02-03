import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hura_test/app/data/model/user.dart';
import 'package:hura_test/core/model/api_response.dart';
import 'package:hura_test/core/utils/toast/toast.dart';

import '../providers/user_provider.dart';

class ViewUserController extends GetxController {
  var isGetUserLoading = RxBool(false);
  var showRetry = RxBool(false);
  RxList<User> users = <User>[].obs;

  final UserProvider _userProvider = UserProvider();
  onInit() {
    loadUsers();
    super.onInit();
  }

  Future<Either<ApiResponse, List<User>>> loadUsers() async {
    isGetUserLoading.value = true;
    final result = await _userProvider.getUsers({});

    result.fold(
      (l) {
        // Handle error
        displayErrorToast(Get.context!, l.message);
        isGetUserLoading.value = false;
        showRetry.value = true;
      },
      (r) {
        // Handle success
        isGetUserLoading.value = false;
        showRetry.value = false;
        users.assignAll(r);
      },
    );
    print(result);
    return result;
  }
}
