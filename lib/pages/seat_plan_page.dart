import 'package:flutter/material.dart';
import 'package:flutter_frontend/models/bus_schedule.dart';
import 'package:flutter_frontend/utils/colors.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({super.key});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  late BusSchedule schedule;
  late String departureDate;
  int totalSeatBooked = 0;
  String totalSeatNumbers = '';
  List<String> selectedSeats = [];
  bool isFirst = true;
  bool isDataLoading = true;
  ValueNotifier<String> selectedSeatStringNotifier = ValueNotifier(''); 

  @override
  void didChangeDependencies() {
    final argsList = ModalRoute.of(context)!.settings.arguments as List;
    schedule = argsList[0];
    departureDate = argsList[1];
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Plan'),
        backgroundColor: const Color.fromARGB(255, 239, 238, 238),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: seatBookedColor,
                        ),
                        const SizedBox(width: 8),
                        const Text('Booked', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: seatAvailableColor,
                        ),
                        const SizedBox(width: 8),
                        const Text('Available', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedSeatStringNotifier,
              builder: (context, value, _) => Text(
                'Selected Seats: $value',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Book Selected Seats'),)
          ],
        )
      ),
    );
  }
}