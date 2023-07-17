import 'dart:convert';
import 'package:kioser_booking/models/detail_booking.dart';
import 'package:kioser_booking/services/auth.dart';
import 'package:kioser_booking/services/id.dart';
import 'package:http/http.dart' as http;

class BookingRoomService {
  static Future<List<Store>> fetchRooms() async {
    String? token = "Bearer ${Auth.accessToken}";
    String? idku = number.setAccessId as String?;
    String url = "https://yusroom.be.sman17gowa.com/api/user/room/$idku";

    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': token,
    });

    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final transformed = results.map((e) {
      final room = Room(
        id: e['room']['id'],
        name: e['room']['name'],
        image: e['room']['image'],
        description: e['room']['description'],
        isActive: e['room']['isActive'],
        createdAt: e['room']['createdAt'],
        updatedAt: e['room']['updatedAt'],
      );

      final times = (e['times'] as List<dynamic>).map((t) {
        return Time(
          id: t['id'],
          startTime: t['startTime'],
          endTime: t['endTime'],
          createdAt: t['createdAt'],
          updatedAt: t['updatedAt'],
        );
      }).toList();

      final confirmedBookings =
          (e['confirmedBookings'] as List<dynamic>).map((b) {
        return Booking(
          id: b['id'],
          userId: b['userId'],
          roomId: b['roomId'],
          bookingDate: b['bookingDate'],
          startTime: b['startTime'],
          endTime: b['endTime'],
          isApproved: b['isApproved'],
          description: b['description'],
          createdAt: b['createdAt'],
          updatedAt: b['updatedAt'],
        );
      }).toList();

      return Store(
        responseCode: e['responseCode'],
        responseStatus: e['responseStatus'],
        responseMessage: e['responseMessage'],
        room: room,
        times: times,
        confirmedBookings: confirmedBookings,
      );
    }).toList();
    return transformed;
  }
}
