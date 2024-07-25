import 'package:cc_flutter_training/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/controllers/users_controller.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Training',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: UsersBinding(),
    );
  }
}
