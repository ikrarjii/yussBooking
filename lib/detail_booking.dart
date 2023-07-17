import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:kioser_booking/services/detail_booking.dart';

import 'models/detail_booking.dart';
import 'models/detail_booking.dart';

class BookingDetail extends StatefulWidget {
  final int id;

  const BookingDetail({super.key, required this.id});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  bool isColor = false;
  bool isText = false;
  List Store = [];
  @override
  void initState() {
    super.initState();
    // DetailRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Store.length,
        itemBuilder: (context, index) {
     
          final store = Store[index];
          log(store.toString());
          return ListTile(
            title: Text("okok"),
          );
        },
      ),
    );
  }

  // void DetailRoom() async {
  //   final room = await BookingRoomService.fetchRooms();
  //   setState(() {
  //     Store = room;
  //   });
  // }
}
