import 'package:dio/dio.dart';
import 'package:flutter_tasks/model/filter_user_model.dart';
import 'package:flutter_tasks/model/repos_model.dart';
import 'package:flutter_tasks/model/users_model.dart';

class ApiRepository {
  final String apiUrl = "https://api.github.com/users?since=0/&per_page=100";
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
        return jsonResponse.map((users) => ReposModel.fromJson(users)).toList();
      } else {
        throw Exception('Failed to load repos');
      }
    } catch (e) {
      throw Exception('Failed to load repos');
    }
  }

  Future searchUsers(String user) async {
    try {
      final response = await _dio.get('https://api.github.com/search/users?q=$user');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<dynamic> items = jsonResponse['items'];
        return items.map((user) => Items.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load users');
    }
  }

}
