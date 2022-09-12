import 'dart:convert';

import 'package:flutter_application_1/models/user_list.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<ListUsers> searchUsers(
      String keyword, int page, int pageSize) async {
    String url =
        "https://api.github.com/search/users?q=$keyword&page=$page&per_page=$pageSize";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ListUsers.fromJson(json.decode(response.body));
      } else {
        throw Exception('Code: ${response.statusCode} Error: ${response.body}');
      }
    } catch (ex) {
      rethrow;
    }
  }
}
