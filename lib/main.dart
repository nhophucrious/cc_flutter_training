import 'package:cc_flutter_training/app/routes/app_pages.dart';
import 'package:cc_flutter_training/database/daos/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'database/app_database.dart';
import 'service/api_service.dart';
import 'ui/controllers/users_controller.dart';
import 'package:dio/dio.dart';



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_flutter_training/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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



class UserDaoController extends GetxController {
  final UserDao userDao;

  UserDaoController(this.userDao);
}
