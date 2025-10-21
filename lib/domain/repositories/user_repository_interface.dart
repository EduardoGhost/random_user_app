import '../entity/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> fetchUsers();
  Future<void> saveUser(User user);
  Future<void> removeUser(String uuid);
  Future<List<User>> getPersistedUsers();
}