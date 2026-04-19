import 'dart:js_interop';

import '../models/bus.dart';
import '../models/seat.dart';

class SampleData {
  static List<Bus> getBusesForSearch(String from, String to, DateTime date) {
    // All sample buses
    final allBuses = [
      Bus(
        id: '1',
        name: 'Express Plus',
        busNumber: 'RJ-01-AB-1234',
        departureTime: '08:00 AM',
        arrivalTime: '02:00 PM',
        price: 450.0,
        availableSeats: 15,
        totalSeats: 50,
        from: 'Jaipur',
        to: 'Delhi',
        date: date,
      ),
      Bus(
        id: '2',
        name: 'City Cruiser',
        busNumber: 'MH-02-CD-5678',
        departureTime: '10:30 AM',
        arrivalTime: '04:30 PM',
        price: 350.0,
        availableSeats: 8,
        totalSeats: 45,
        from: 'Mumbai',
        to: 'Pune',
        date: date,
      ),
      Bus(
        id: '3',
        name: 'Super Deluxe',
        busNumber: 'KA-03-EF-9012',
        departureTime: '02:00 PM',
        arrivalTime: '08:00 PM',
        price: 550.0,
        availableSeats: 22,
        totalSeats: 40,
        from: 'Bangalore',
        to: 'Hyderabad',
        date: date,
      ),
      Bus(
        id: '4',
        name: 'Comfort Ride',
        busNumber: 'TN-04-GH-3456',
        departureTime: '05:00 PM',
        arrivalTime: '11:00 PM',
        price: 400.0,
        availableSeats: 5,
        totalSeats: 50,
        from: 'Chennai',
        to: 'Bangalore',
        date: date,
      ),
      Bus(
        id: '5',
        name: 'Night Express',
        busNumber: 'UP-05-IJ-7890',
        departureTime: '09:00 PM',
        arrivalTime: '05:00 AM',
        price: 600.0,
        availableSeats: 12,
        totalSeats: 45,
        from: 'Lucknow',
        to: 'Delhi',
        date: date,
      ),
      Bus(
        id: '6',
        name: 'Royal Travels',
        busNumber: 'GJ-06-KL-2345',
        departureTime: '07:30 AM',
        arrivalTime: '01:30 PM',
        price: 480.0,
        availableSeats: 18,
        totalSeats: 50,
        from: 'Ahmedabad',
        to: 'Jaipur',
        date: date,
      ),
      Bus(
        id: '7',
        name: 'Eastern Ride',
        busNumber: 'WB-07-MN-6789',
        departureTime: '06:00 AM',
        arrivalTime: '12:00 PM',
        price: 420.0,
        availableSeats: 20,
        totalSeats: 48,
        from: 'Kolkata',
        to: 'Lucknow',
        date: date,
      ),
      Bus(
        id: '8',
        name: 'Metro Link',
        busNumber: 'MH-08-OP-1122',
        departureTime: '03:00 PM',
        arrivalTime: '09:00 PM',
        price: 370.0,
        availableSeats: 10,
        totalSeats: 44,
        from: 'Pune',
        to: 'Mumbai',
        date: date,
      ),
      Bus(
        id: '8',
        name: 'Metro Link',
        busNumber: 'MH-08-OP-1122',
        departureTime: '03:00 PM',
        arrivalTime: '09:00 PM',
        price: 370.0,
        availableSeats: 10,
        totalSeats: 44,
        from: 'Jaipur',
        to: 'Delhi',
        date: date,
      ),
      Bus(
        id: '7',
        name: 'Eastern Ride',
        busNumber: 'WB-07-MN-6789',
        departureTime: '06:00 AM',
        arrivalTime: '12:00 PM',
        price: 420.0,
        availableSeats: 20,
        totalSeats: 48,
        from: 'Jaipur',
        to: 'Delhi',
        date: date,
      ),
    ];

    // Filter buses by 'from' and 'to' (case-insensitive, trimmed)
    return allBuses.where((bus) =>
      bus.from.trim().toLowerCase() == from.trim().toLowerCase() &&
      bus.to.trim().toLowerCase() == to.trim().toLowerCase()
    ).toList();
  }

  static List<Seat> getSeatsForBus(String busId) {
    List<Seat> seats = [];
    int rows = 10;
    int columns = 5;

    // Get bus details to determine pricing
    Bus? bus;
    try {
      bus = getBusesForSearch(
        '',
        '',
        DateTime.now(),
      ).firstWhere((b) => b.id == busId);
    } catch (e) {
      bus = null;
    }

    double busPrice = bus?.price ?? 450.0;

    // All seats show the same bus price
    // Outside seats: columns A and E (only 5 available)
    // Inside seats: columns B, C, D

    List<String> bookedSeatNumbers = ['1A', '2B', '3C', '4D', '5E', '7A', '8B'];
    int outsideSeatsCreated = 0;
    int outsideSeatsAvailableCount = 5;

    for (int i = 1; i <= rows; i++) {
      for (int j = 0; j < columns; j++) {
        String columnLetter = String.fromCharCode(65 + j); // A, B, C, D, E
        String seatNumber = '$i$columnLetter';

        // Determine if seat is outside (A or E) or inside (B, C, D)
        bool isOutsideSeat = (j == 0 || j == 4); // Column A or E
        SeatType seatType = isOutsideSeat ? SeatType.outside : SeatType.inside;

        // All seats use bus price
        double seatPrice = busPrice;

        SeatStatus status = bookedSeatNumbers.contains(seatNumber)
            ? SeatStatus.booked
            : SeatStatus.available;

        // For outside seats, mark as booked if we've already created more than 5 available
        if (isOutsideSeat) {
          outsideSeatsCreated++;
          if (outsideSeatsCreated > outsideSeatsAvailableCount) {
            status = SeatStatus.booked;
          }
        }

        seats.add(
          Seat(
            seatNumber: seatNumber,
            status: status,
            price: seatPrice,
            seatType: seatType,
          ),
        );
      }
    }

    return seats;
  }
}
