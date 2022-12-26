import 'dart:convert';

import 'package:bloc_api_demo/model/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  final endPoint = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUsers() async {
    final response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'] as List;
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
