import 'package:cc_flutter_training/database/daos/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:cc_flutter_training/database/app_database.dart';
import 'package:cc_flutter_training/ui/models/user_model.dart';
import 'package:cc_flutter_training/service/api_service.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() async {
    // Initialize the database and UserDao
    final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .addMigrations([migration1to2])
      .build();
    final userDao = database.userDao;
    
    // Initialize the ApiService with Dio
    final dio = Dio();
    final apiService = ApiService(dio);

    // Register the dependencies
    Get.put(userDao);
    Get.put(apiService);
    Get.lazyPut<UsersController>(() => UsersController(apiService: apiService, userDao: userDao), fenix: true);
  }
}

class UsersController extends GetxController {
  final UserDao userDao;
  final ApiService apiService;

  UsersController({required this.userDao, required this.apiService});

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  final TextEditingController textEditingController = TextEditingController();
  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

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

  // delete all users from the database
  Future<void> deleteAllUsers() async {
    try {
      await userDao.deleteAllUsers();
      users.clear();
      Get.snackbar('Success', 'All users deleted successfully!',
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 2));
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete users: $e');
    }
  }
}
