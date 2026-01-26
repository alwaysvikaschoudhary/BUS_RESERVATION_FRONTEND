import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../models/seat.dart';
import '../utils/sample_data.dart';
import '../widgets/seat_widget.dart';
import 'passenger_details_page.dart';

class SeatSelectionPage extends StatefulWidget {
  final Bus bus;

  const SeatSelectionPage({
    super.key,
    required this.bus,
  });

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  late List<Seat> seats;
  List<String> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    seats = SampleData.getSeatsForBus(widget.bus.id);
  }

  void _toggleSeatSelection(Seat seat) {
    if (seat.status == SeatStatus.booked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This seat is already booked'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      if (selectedSeats.contains(seat.seatNumber)) {
        selectedSeats.remove(seat.seatNumber);
        seat.status = SeatStatus.available;
      } else {
        if (selectedSeats.length >= 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maximum 5 seats can be selected at a time'),
              backgroundColor: Colors.orange,
            ),
          );
          return;
        }
        selectedSeats.add(seat.seatNumber);
        seat.status = SeatStatus.selected;
      }
    });
  }

  double get totalPrice {
    double total = 0;
    for (String seatNumber in selectedSeats) {
      Seat? seat = seats.firstWhere(
        (s) => s.seatNumber == seatNumber,
        orElse: () => Seat(
          seatNumber: '',
          status: SeatStatus.available,
          price: 0,
          seatType: SeatType.inside,
        ),
      );
      total += seat.price;
    }
    return total;
  }

  void _proceedToBooking() {
    if (selectedSeats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one seat'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PassengerDetailsPage(
          bus: widget.bus,
          selectedSeats: selectedSeats,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Seats'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Details
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.bus.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Bus No: ${widget.bus.busNumber}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${widget.bus.departureTime} - ${widget.bus.arrivalTime}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLegendItem(Colors.green, 'Available'),
                  _buildLegendItem(Colors.red, 'Booked'),
                  _buildLegendItem(Colors.deepPurple, 'Selected'),
                ],
              ),
              const SizedBox(height: 24),
              // Seats Grid
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        // Generate seat grid - 5 columns, 10 rows
                        for (int row = 0; row < 10; row++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int col = 0; col < 5; col++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        final seatIndex = row * 5 + col;
                                        if (seatIndex < seats.length) {
                                          _toggleSeatSelection(seats[seatIndex]);
                                        }
                                      },
                                      child: SeatWidget(
                                        seat: seats[row * 5 + col],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Selected Seats Summary
              if (selectedSeats.isNotEmpty)
                Card(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selected Seats',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          selectedSeats.join(', '),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Total: ₹${totalPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              // Booking Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _proceedToBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    selectedSeats.isEmpty
                        ? 'Select Seats to Continue'
                        : 'Proceed to Booking',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
