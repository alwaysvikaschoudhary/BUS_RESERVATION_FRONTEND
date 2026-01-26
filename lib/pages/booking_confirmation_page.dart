import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../models/passenger.dart';
import 'search_page.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Bus bus;
  final List<String> selectedSeats;
  final double totalPrice;
  final Passenger passenger;

  const BookingConfirmationPage({
    super.key,
    required this.bus,
    required this.selectedSeats,
    required this.totalPrice,
    required this.passenger,
  });

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SearchPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookingId = 'BK${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    final bookingDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Success Icon and Message
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green[700],
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Booking Confirmed!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your bus ticket has been confirmed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Ticket Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Bus Ticket',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Booking ID: $bookingId',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Bus Details Section
                      const Text(
                        'Bus Details',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow('Bus Name:', bus.name),
                      _buildDetailRow('Bus Number:', bus.busNumber),
                      _buildDetailRow(
                        'Route:',
                        '${bus.from} → ${bus.to}',
                      ),
                      const SizedBox(height: 16),
                      // Journey Details
                      const Text(
                        'Journey Details',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        'Date:',
                        '${bus.date.day}/${bus.date.month}/${bus.date.year}',
                      ),
                      _buildDetailRow(
                        'Departure Time:',
                        bus.departureTime,
                      ),
                      _buildDetailRow(
                        'Arrival Time:',
                        bus.arrivalTime,
                      ),
                      const SizedBox(height: 16),
                      // Seat Details
                      const Text(
                        'Seat Information',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        'Seats:',
                        selectedSeats.join(', '),
                      ),
                      _buildDetailRow(
                        'Number of Seats:',
                        selectedSeats.length.toString(),
                      ),
                      const SizedBox(height: 16),
                      // Passenger Details
                      const Text(
                        'Passenger Information',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow('Name:', passenger.name),
                      _buildDetailRow('Phone:', passenger.phoneNumber),
                      _buildDetailRow('Email:', passenger.email),
                      const SizedBox(height: 16),
                      // Price Breakdown
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            _buildDetailRow(
                              'Price per Seat:',
                              '₹${bus.price.toStringAsFixed(0)}',
                            ),
                            _buildDetailRow(
                              'Number of Seats:',
                              '${selectedSeats.length}',
                            ),
                            const Divider(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Amount:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '₹${totalPrice.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Booking Date and Time
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.grey[600],
                              size: 18,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Booked on: ${bookingDate.day}/${bookingDate.month}/${bookingDate.year} at ${bookingDate.hour}:${bookingDate.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Important Notice
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  border: Border.all(color: Colors.yellow[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.orange[700],
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Confirmation has been sent to ${passenger.email}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Back to Home Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _goToHome(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
