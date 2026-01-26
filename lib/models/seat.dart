enum SeatStatus { available, booked, selected }
enum SeatType { inside, outside }

class Seat {
  final String seatNumber;
  SeatStatus status;
  final double price;
  final SeatType seatType;

  Seat({
    required this.seatNumber,
    required this.status,
    required this.price,
    required this.seatType,
  });
}
