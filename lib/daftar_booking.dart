import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kioser_booking/detail.dart';
import 'package:kioser_booking/detail_booking.dart';
import 'package:kioser_booking/main.dart';
import 'package:kioser_booking/models/logOut.dart';
import 'package:kioser_booking/models/room_user.dart';
import 'package:http/http.dart' as http;
import 'package:kioser_booking/services/id.dart';
import 'package:kioser_booking/services/room_api.dart';

import 'services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Room> rooms = [];
  String? token = "Bearer ${Auth.accessToken}";
  @override
  void initState() {
    super.initState();
    klik();
  }

  Future<void> klik() async {
    final response = await RoomApi.klik();
    setState(() {
      rooms = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('IKRAR RESTU GIBRANI'),
                            Text('MAHASISWA'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profil'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Detail Booking'),
              onTap: () {
              
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: LogOut,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          final id = room.id;
          return InkWell(
            onTap: () {
              number.setAccessId(id.toString());
              print(id.toString());
              navigateToBooking(id);
            },
            child: Card(
              child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              room.image,
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              room.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                room.description,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  // Future<void> navigateToEditPage() async {
  //   final route = MaterialPageRoute(builder: (context) => HalamanTujuan());
  //   Navigator.push(context, route);
  // }

 Future<void> navigateToBooking(int id) async {
  final route = MaterialPageRoute(builder: (context) => BookingDetail(id: id));
  Navigator.push(context, route);
}

  void featchRoom() async {
    final room = await RoomApi.klik();
    setState(() {
      rooms = room;
    });
  }

  void LogOut() async {
    const url = "https://yusroom.be.sman17gowa.com/api/logout";
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token',
    });

    if (response.statusCode == 200) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
      print('Logout successful');
      // Add your logout code here
    } else {
      print('Logout failed');
      // Handle other response codes if needed
    }
  }
}
