import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hura_test/app/modules/home/widgets/main_tile.dart';
import 'package:hura_test/app/routes/app_pages.dart';
import 'package:hura_test/core/extensions/color.dart';
import 'package:hura_test/core/resources/appbar/app_appbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Home Screen'),
      body: Column(
        children: [
          Gap(20),
          MainTile(
            icon: CircleAvatar(
              backgroundColor: context.getScheme.primary.withOpacity(0.7),
              child: Icon(Icons.add, color: Colors.white),
            ),
            title: 'Add User',
            onTap: () {
              Get.toNamed(Routes.CREATE_USER);
            },
          ),
          Gap(20),
          MainTile(
            icon:
                Icon(Icons.search, size: 50, color: context.getScheme.primary),
            title: 'View Users',
            onTap: () {
              Get.toNamed(Routes.USER);
            },
          ),
        ],
      ),
    );
  }
}
