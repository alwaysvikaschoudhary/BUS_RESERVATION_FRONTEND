class Bus {
  final String id;
  final String name;
  final String busNumber;
  final String departureTime;
  final String arrivalTime;
  final double price;
  final int availableSeats;
  final int totalSeats;
  final String from;
  final String to;
  final DateTime date;

  Bus({
    required this.id,
    required this.name,
    required this.busNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.availableSeats,
    required this.totalSeats,
    required this.from,
    required this.to,
    required this.date,
  });

  int get bookedSeats => totalSeats - availableSeats;
}
