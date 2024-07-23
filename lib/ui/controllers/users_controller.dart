import 'package:cc_flutter_training/database/daos/user_dao.dart';
import 'package:get/get.dart';
import 'package:cc_flutter_training/database/app_database.dart';
import 'package:cc_flutter_training/ui/models/user_model.dart';
import 'package:cc_flutter_training/service/api_service.dart';

class UsersController extends GetxController {
  final UserDao userDao;
  final ApiService apiService;
  final RxList<User> users = <User>[].obs;

  UsersController({required this.userDao, required this.apiService});

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final localUsers = await userDao.findAllUsers();
      if (localUsers.isNotEmpty) {
        Get.snackbar('Hmm', 'Seems like database is already populated.',
            snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 2));
        users.assignAll(localUsers);
      } else {
        final fetchedUsers = await apiService.getUsers();
        for (var user in fetchedUsers) {
          await userDao.insertUser(user);
        }
        users.assignAll(fetchedUsers);
        Get.snackbar('Success', 'Users fetched and saved successfully!',
            snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users: $e');
    }
  }
}
