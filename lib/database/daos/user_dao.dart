import 'package:floor/floor.dart';
import 'package:cc_flutter_training/ui/models/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<void> insertUsers(List<User> users);

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();
}