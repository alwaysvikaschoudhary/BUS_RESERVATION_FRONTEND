
import '../models/bus_model.dart';
import '../models/bus_reservation.dart';
import '../models/bus_schedule.dart';
import '../models/but_route.dart';
import '../utils/constants.dart';

class TempDB {
  static List<Bus> tableBus = [
    Bus(busId: 1, busName: 'Volvo Luxury Travels', busNumber: 'MH-01-AB-1001', busType: busTypeACBusiness, totalSeat: 18),
    Bus(busId: 2, busName: 'Gold Standard Coach', busNumber: 'DL-01-CD-2002', busType: busTypeACEconomy, totalSeat: 32),
    Bus(busId: 3, busName: 'Express Highway Service', busNumber: 'KA-01-EF-3003', busType: busTypeNonAc, totalSeat: 30),
    Bus(busId: 4, busName: 'Royal Travels Premium', busNumber: 'TN-01-GH-4004', busType: busTypeACEconomy, totalSeat: 20),
    Bus(busId: 5, busName: 'Shatabdi Bus Service', busNumber: 'UP-01-IJ-5005', busType: busTypeNonAc, totalSeat: 25),
  ];

  static List<BusRoute> tableRoute = [
    BusRoute(routeId: 1, routeName: 'Mumbai-Delhi', cityFrom: 'Mumbai', cityTo: 'Delhi', distanceInKm: 1400),
    BusRoute(routeId: 2, routeName: 'Delhi-Bangalore', cityFrom: 'Delhi', cityTo: 'Bangalore', distanceInKm: 2150),
    BusRoute(routeId: 3, routeName: 'Bangalore-Chennai', cityFrom: 'Bangalore', cityTo: 'Chennai', distanceInKm: 350),
    BusRoute(routeId: 4, routeName: 'Kolkata-Hyderabad', cityFrom: 'Kolkata', cityTo: 'Hyderabad', distanceInKm: 1450),
    BusRoute(routeId: 5, routeName: 'Pune-Jaipur', cityFrom: 'Pune', cityTo: 'Jaipur', distanceInKm: 1280),
  ];
  static List<BusSchedule> tableSchedule = [
    BusSchedule(scheduleId: 1, bus: tableBus[0], busRoute: tableRoute[1], departureTime: '10:00', ticketPrice: 1220,),
    BusSchedule(scheduleId: 2, bus: tableBus[1], busRoute: tableRoute[2], departureTime: '20:00', ticketPrice: 1420,),
    BusSchedule(scheduleId: 3, bus: tableBus[2], busRoute: tableRoute[3], departureTime: '02:00', ticketPrice: 1040,),
    BusSchedule(scheduleId: 4, bus: tableBus[3], busRoute: tableRoute[4], departureTime: '16:00', ticketPrice: 850,),
    BusSchedule(scheduleId: 5, bus: tableBus[4], busRoute: tableRoute[0], departureTime: '08:00', ticketPrice: 1360,),
  ];
  static List<BusReservation> tableReservation = [];
}