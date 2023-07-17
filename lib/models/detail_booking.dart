class Store {
  final String responseCode;
  final String responseStatus;
  final String responseMessage;
  final Room room;
  final List<Time> times;
  final List<Booking> confirmedBookings;

  Store({
    required this.responseCode,
    required this.responseStatus,
    required this.responseMessage,
    required this.room,
    required this.times,
    required this.confirmedBookings,
  });
}

class Room {
  final int id;
  final String name;
  final String image;
  final String description;
  final int isActive;
  final String createdAt;
  final String updatedAt;

  Room({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Time {
  final int id;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;

  Time({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Booking {
  final int id;
  final int userId;
  final int roomId;
  final String bookingDate;
  final String startTime;
  final String endTime;
  final bool? isApproved;
  final String description;
  final String createdAt;
  final String updatedAt;
  Booking({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.isApproved,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
}










