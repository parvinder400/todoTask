import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yockettask/app/bindings/initial_binding.dart';
import 'package:yockettask/app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  // box.write('onbord', '0');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YocketTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
      initialRoute: Routes.INITIAL,
    );
  }
}
