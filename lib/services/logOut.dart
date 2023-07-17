import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static Future<Map<String, dynamic>> logout() async {
    final url = "https://yusroom.be.sman17gowa.com/api/user/logout";
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    return json as Map<String, dynamic>;
  }
}
