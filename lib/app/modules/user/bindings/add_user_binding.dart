import 'package:get/get.dart';
import 'package:hura_test/core/server/dio_services.dart';

import '../controllers/add_user_controller.dart';

class AddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUserController>(
      () => AddUserController(),
    );
    Get.lazyPut<DioServices>(
      () => DioServices(),
    );
  }
}
