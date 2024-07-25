import 'package:cc_flutter_training/service/api_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
// import path provider to use getApplicationDocumentsDirectory(); -> this is mandatory for isar.

class AlternateUsersBinding extends Bindings {
  @override
  void dependencies() async {
    
    // Initialize the ApiService with Dio
    final dio = Dio();
    final apiService = ApiService(dio);
    
    // TODO: Initialize the isar database

    // Register the dependencies
    Get.put(apiService);
    Get.lazyPut<AlternateUsersController>(() => AlternateUsersController(apiService: apiService), fenix: true);
  }
}
class AlternateUsersController extends GetxController {

  final ApiService apiService;

  AlternateUsersController({required this.apiService});

  var users = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // also fetches users from the API,
  // but stores in isar instead of floor

  void fetchUsers() async {
    final fetchedUsers = await apiService.getUsers();
    users.assignAll(fetchedUsers);
  }

}