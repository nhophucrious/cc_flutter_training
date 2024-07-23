import 'package:get/get.dart';
import 'package:cc_flutter_training/ui/models/user_model.dart';
import 'package:cc_flutter_training/service/api_service.dart';
import 'package:dio/dio.dart';

class UsersController extends GetxController {
  final RxList<User> users = <User>[].obs;
  final ApiService apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      final fetchedUsers = await apiService.getUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users: $e');
    }
  }
}