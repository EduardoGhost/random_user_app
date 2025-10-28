import 'package:hive/hive.dart';
import '../../domain/entity/user.dart';

class UserLocalDataSource {
  static const String boxName = 'users';

  Future<void> saveUser(User user) async {
    final box = await Hive.openBox(boxName);
    await box.put(user.uuid, user.toJson());
  }

  Future<void> removeUser(String uuid) async {
    final box = await Hive.openBox(boxName);
    await box.delete(uuid);
  }

  Future<List<User>> getPersistedUsers() async {
    final box = await Hive.openBox(boxName);
    return box.values
        .map((e) => User.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}