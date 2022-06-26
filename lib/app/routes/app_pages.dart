import 'package:get/get.dart';
import 'package:yockettask/app/ui/dashboard_screen.dart';

part 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => DashboardScreen(),
    ),
  ];
}
