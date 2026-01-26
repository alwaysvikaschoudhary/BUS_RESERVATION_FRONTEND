import '../models/bus.dart';
import '../models/seat.dart';

class SampleData {
  static List<Bus> getBusesForSearch(
    String from,
    String to,
    DateTime date,
  ) {
    return [
      Bus(
        id: '1',
        name: 'Express Plus',
        busNumber: 'AP-01-AB-1234',
        departureTime: '08:00 AM',
        arrivalTime: '02:00 PM',
        price: 450.0,
        availableSeats: 15,
        totalSeats: 50,
        from: from,
        to: to,
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
        from: from,
        to: to,
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
        from: from,
        to: to,
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
        from: from,
        to: to,
        date: date,
      ),
    ];
  }

  static List<Seat> getSeatsForBus(String busId) {
    List<Seat> seats = [];
    int rows = 10;
    int columns = 5;

    // Get bus details to determine pricing
    Bus? bus;
    try {
      bus = getBusesForSearch('', '', DateTime.now())
          .firstWhere((b) => b.id == busId);
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
