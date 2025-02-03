import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hura_test/core/extensions/color.dart';
import 'package:hura_test/core/resources/appbar/app_appbar.dart';
import 'package:hura_test/core/resources/button/primary_button.dart';

import '../controllers/user_controller.dart';

class AddUserView extends GetView<UserController> {
  const AddUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBar(title: 'Create User'),
        body: Column(
          children: [
            const Gap(20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: controller.firstNameC,
                  onChanged: (value) => controller.firstName.value = value,
                  decoration: InputDecoration(
                      hintText: 'First Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                )),
            const Gap(20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: controller.lastNameC,
                  onChanged: (value) => controller.lastName.value = value,
                  decoration: InputDecoration(
                      hintText: 'Last Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                )),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => PrimaryButton(
                      height: 45,
                      width: context.width * 0.25,
                      title: 'Clear',
                      isLoading: false,
                      onTap: controller.isLoading.value
                          ? () {}
                          : () {
                              controller.clear();
                            },
                    )),
                const Gap(20),
                Obx(() => PrimaryButton(
                      height: 45,
                      width: context.width * 0.5,
                      title: 'Add User',
                      isLoading: controller.isLoading.value,
                      onTap: () {
                        controller.createUser(context);
                      },
                    )),
              ],
            )
            // AppFormField(
            //     controller: lastName, noBorder: false, hintText: 'Last Name'),
          ],
        ));
  }
}
