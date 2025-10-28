import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSource({this.baseUrl = 'https://randomuser.me/api/'});

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
}
