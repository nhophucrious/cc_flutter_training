import 'package:cc_flutter_training/app/routes/app_pages.dart';
import 'package:cc_flutter_training/database/daos/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'database/app_database.dart';
import 'service/api_service.dart';
import 'ui/controllers/users_controller.dart';
import 'package:dio/dio.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final userDao = database.userDao;
  final dio = Dio();
  final apiService = ApiService(dio);

  runApp(MyApp(userDao: userDao, apiService: apiService));
}

class MyApp extends StatelessWidget {
  final UserDao userDao;
  final ApiService apiService;

  const MyApp({Key? key, required this.userDao, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Training',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(UserDaoController(userDao)); // Inject UserDaoController
        Get.put(UsersController(userDao: userDao, apiService: apiService));
      }),
    );
  }
}


class UserDaoController extends GetxController {
  final UserDao userDao;

  UserDaoController(this.userDao);
}
