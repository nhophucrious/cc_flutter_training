
import 'package:cc_flutter_training/ui/controllers/alternate_users_controller.dart';
import 'package:cc_flutter_training/ui/controllers/users_controller.dart';
import 'package:cc_flutter_training/ui/views/alternate_users_page.dart';
import 'package:get/route_manager.dart';

import '../../ui/views/home_page.dart';
import '../../ui/views/individual_user_page.dart';
import '../../ui/views/users_page.dart';

part 'app_routes.dart';


class AppPages {
  static const INITIAL = Paths.HOME;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomePage()
    ),
    GetPage(
      name: Paths.USERS,
      page: () => const UsersPage(),
      binding: UsersBinding()
    ),
    GetPage(
      name: Paths.USERS_ALT,
      page: () => const AlternateUsersPage(),
      binding: AlternateUsersBinding()
    ),
    GetPage(
      name: Paths.INDIVIDUAL_USER,
      page: () => IndividualUserPage()
    ),
  ];
  
}