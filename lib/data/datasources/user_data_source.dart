import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entity/user.dart';
import 'package:hive/hive.dart';

class UserDataSource {
  final String baseUrl;

  UserDataSource({this.baseUrl = 'https://randomuser.me/api/'});

  // API
  Future<List<Map<String, dynamic>>> fetchUsers({int results = 10}) async {
    final response = await http.get(Uri.parse('$baseUrl?results=$results'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final resultsList = List<Map<String, dynamic>>.from(data['results']);
      return resultsList;
    } else {
      throw Exception('Erro ao buscar usuários da API');
    }
  }

  // Persistência local com Hive
  Future<void> saveUser(User user) async {
    final box = await Hive.openBox('users');
    await box.put(user.uuid, user.toJson());
  }

  Future<void> removeUser(String uuid) async {
    final box = await Hive.openBox('users');
    await box.delete(uuid);
  }

  Future<List<User>> getPersistedUsers() async {
    final box = await Hive.openBox('users');
    return box.values.map((e) => User.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
