// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static Future<void> createBooking(
//       String startTime, String endTime, String description, int roomId) async {
//     const url = "http://127.0.0.1:8000/api/user/booking";
//     final uri = Uri.parse(url);

//     final Map<String, dynamic> requestData = {
//       'start_time': startTime,
//       'end_time': endTime,
//       'description': description,
//       'room_id': roomId,
//     };

//     final headers = {
//       'Content-Type': 'application/json',
//     };

//     final response = await http.post(
//       uri,
//       headers: headers,
//       body: jsonEncode(requestData),
//     );

//     if (response.statusCode == 200) {
//       print('Booking created successfully!');
//     } else {
//       print('Failed to create booking. Error: ${response.statusCode}');
//     }
//   }
// }
