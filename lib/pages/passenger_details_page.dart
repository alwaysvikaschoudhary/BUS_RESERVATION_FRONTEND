import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../models/passenger.dart';
import 'booking_confirmation_page.dart';

class PassengerDetailsPage extends StatefulWidget {
  final Bus bus;
  final List<String> selectedSeats;
  final double totalPrice;

  const PassengerDetailsPage({
    super.key,
    required this.bus,
    required this.selectedSeats,
    required this.totalPrice,
  });

  @override
  State<PassengerDetailsPage> createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _proceedToConfirmation() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final passenger = Passenger(
      name: _nameController.text,
      phoneNumber: _phoneController.text,
      email: _emailController.text,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationPage(
          bus: widget.bus,
          selectedSeats: widget.selectedSeats,
          totalPrice: widget.totalPrice,
          passenger: passenger,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Details'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Enter Your Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please provide your information to complete the booking',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your full name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Phone Number Field
                    Text(
                      'Phone Number',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    Text(
                      'Email Address',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    // Booking Summary Card
                    Card(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Booking Summary',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildSummaryRow('Bus:', widget.bus.name),
                            _buildSummaryRow(
                              'Bus No:',
                              widget.bus.busNumber,
                            ),
                            _buildSummaryRow(
                              'Date:',
                              '${widget.bus.date.day}/${widget.bus.date.month}/${widget.bus.date.year}',
                            ),
                            _buildSummaryRow(
                              'Departure:',
                              widget.bus.departureTime,
                            ),
                            const Divider(height: 16),
                            _buildSummaryRow(
                              'Seats:',
                              widget.selectedSeats.join(', '),
                            ),
                            _buildSummaryRow(
                              'Number of Seats:',
                              '${widget.selectedSeats.length}',
                            ),
                            const Divider(height: 16),
                            _buildSummaryRow(
                              'Price per Seat:',
                              '₹${widget.bus.price.toStringAsFixed(0)}',
                            ),
                            _buildSummaryRow(
                              'Total Price:',
                              '₹${widget.totalPrice.toStringAsFixed(0)}',
                              isHighlight: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Confirm Booking Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _proceedToConfirmation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Confirm Booking',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isHighlight ? 14 : 13,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isHighlight ? 14 : 13,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
