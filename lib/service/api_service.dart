import 'package:cc_flutter_training/ui/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/users')
  Future<List<User>> getUsers();
}