import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hura_test/core/extensions/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../controllers/view_user_controller.dart';

class UserView extends GetView<ViewUserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserView'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
            () => InkWell(
                onTap: () {
                  controller.loadUsers();
                },
                child: controller.isGetUserLoading.value
                    ? LoadingAnimationWidget.horizontalRotatingDots(
                        color: Colors.amber, size: 100)
                    : controller.showRetry.value
                        ? IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              controller.loadUsers();
                            })
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: context.getScheme.primary
                                          .withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: ListTile(
                                    title:
                                        Text(controller.users[index].firstName),
                                    subtitle:
                                        Text(controller.users[index].email),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        controller.users[index].avatar,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.users.length,
                          )),
          ),
        ));
  }
}
