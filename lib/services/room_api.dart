import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kioser_booking/models/room_user.dart';
import 'package:kioser_booking/services/auth.dart';
import 'package:kioser_booking/services/id.dart';

class RoomApi {
  static Future<List<Room>> klik() async {
    String? token = "Bearer ${Auth.accessToken}";
    const url = "https://yusroom.be.sman17gowa.com/api/user/room";
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );
    final body = response.body;

    final json = jsonDecode(body);

  

    final results = json["data"] as List<dynamic>;

    
    final transformed = results.map((e) {
      return Room(
          id: e['id']..toString(),
          name: e['name'].toString(),
          image: e['image'].toString(),
          description: e['description'].toString(),
          IsActive: e['IsActive'].toString(),
          CratedAt: e['CratedAt'].toString(),
          UpdateAt: e['UpdateAt'].toString());
    }).toList();
    return transformed;
  }
}
