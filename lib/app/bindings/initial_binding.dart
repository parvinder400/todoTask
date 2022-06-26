import 'package:get/get.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';
import 'package:yockettask/data/local/local_storage.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorage>(LocalStorageImpl(), permanent: true);
    Get.put<DashboardScreenController>(
        DashboardScreenController(Get.find<LocalStorage>()),
        permanent: true);
    // Get.put(DashboardScreenController());
  }
}
