
import 'package:get/route_manager.dart';

import '../../ui/views/home_page.dart';
import '../../ui/views/individual_user_page.dart';
import '../../ui/views/users_page.dart';

part 'app_routes.dart';


class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage()
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersPage()
    ),
    GetPage(
      name: _Paths.INDIVIDUAL_USER,
      page: () => IndividualUserPage()
    ),
  ];
  
}