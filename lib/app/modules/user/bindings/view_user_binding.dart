import 'package:get/get.dart';
import 'package:hura_test/core/server/dio_services.dart';

import '../controllers/user_controller.dart';
import '../controllers/view_user_controller.dart';

class ViewUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioServices>(DioServices());
    Get.put<ViewUserController>(ViewUserController());
  }
}
