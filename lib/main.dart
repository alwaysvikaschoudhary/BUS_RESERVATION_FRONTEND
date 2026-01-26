import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_frontend/pages/search_page.dart';
import 'package:flutter_frontend/pages/search_result_page.dart';
import 'package:flutter_frontend/pages/seat_plan_page.dart';
import 'package:flutter_frontend/providers/app_data_provider.dart';
import 'package:flutter_frontend/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppDataProvider(),
    child: const MyApp()
  ));
=======
import 'pages/search_page.dart';

void main() {
  runApp(const MyApp());
>>>>>>> bf99582 (first commit)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        brightness: Brightness.light,
      ),
      home: const SearchPage(),
      routes: {
        routeNameHome: (context) => const SearchPage(),
        routeNameSearchResultPage: (context) => const SearchResultPage(),
        routeNameSeatPlanPage: (context) => const SeatPlanPage(),
      },
    );
  }
}
=======
      title: 'Bus Seat Reservation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


>>>>>>> bf99582 (first commit)
