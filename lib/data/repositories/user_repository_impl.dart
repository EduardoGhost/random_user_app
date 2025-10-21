import '../../domain/entity/user.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../datasources/user_data_source.dart';


class UserRepositoryImpl implements UserRepositoryInterface {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<List<User>> fetchUsers() async {
    final usersMapList = await dataSource.fetchUsers(results: 10);
    return usersMapList.map((json) => User.fromJson(json)).toList();
  }

  @override
  Future<void> saveUser(User user) => dataSource.saveUser(user);

  @override
  Future<void> removeUser(String uuid) => dataSource.removeUser(uuid);

  @override
  Future<List<User>> getPersistedUsers() => dataSource.getPersistedUsers();
}
