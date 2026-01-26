import 'package:flutter/material.dart';
import '../models/seat.dart';

class SeatWidget extends StatelessWidget {
  final Seat seat;

  const SeatWidget({
    super.key,
    required this.seat,
  });

  Color get seatColor {
    Color baseColor;
    switch (seat.status) {
      case SeatStatus.available:
        baseColor = Colors.green;
        break;
      case SeatStatus.booked:
        baseColor = Colors.red;
        break;
      case SeatStatus.selected:
        baseColor = Colors.deepPurple;
        break;
    }
    return seat.status == SeatStatus.booked 
        ? baseColor.withOpacity(0.5) 
        : baseColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: seatColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              seat.seatNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '₹${seat.price.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 9,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
