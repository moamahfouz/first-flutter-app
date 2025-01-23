import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/user.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse("${baseUrl}users"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> fetchUserDetails(int userId) async {
    final response = await http.get(Uri.parse("${baseUrl}users/$userId"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
