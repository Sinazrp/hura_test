import 'package:get/get.dart';
import 'package:hura_test/core/server/dio_services.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<DioServices>(
      () => DioServices(),
    );
  }
}
