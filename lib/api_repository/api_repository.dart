import 'package:dio/dio.dart';
import 'package:flutter_tasks/model/repos_model.dart';
import 'package:flutter_tasks/model/users_model.dart';

class ApiRepository {
  final String apiUrl = "https://api.github.com/users";
  final Dio _dio = Dio();

  Future<List<UsersModel>> fetchUsers() async {
    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        List jsonResponse = response.data;
        return jsonResponse.map((post) => UsersModel.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<List<ReposModel>> fetchRepos(String user) async {
    try {
      final response =
          await _dio.get("https://api.github.com/users/$user/repos");

      if (response.statusCode == 200) {
        List jsonResponse = response.data;
        return jsonResponse.map((post) => ReposModel.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load repos');
      }
    } catch (e) {
      throw Exception('Failed to load repos');
    }
  }
}
