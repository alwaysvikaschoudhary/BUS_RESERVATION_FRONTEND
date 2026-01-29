
import '../models/bus_model.dart';
import '../models/bus_reservation.dart';
import '../models/bus_schedule.dart';
import '../models/bus_route.dart';
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
    BusRoute(routeId: 2, routeName: 'Delhi-Surat', cityFrom: 'Delhi', cityTo: 'Surat', distanceInKm: 2150),
    BusRoute(routeId: 3, routeName: 'Kota-Chennai', cityFrom: 'Kota', cityTo: 'Chennai', distanceInKm: 350),
    BusRoute(routeId: 4, routeName: 'Kolkata-Nagpur', cityFrom: 'Kolkata', cityTo: 'Nagpur', distanceInKm: 1450),
    BusRoute(routeId: 5, routeName: 'Pune-Jaipur', cityFrom: 'Pune', cityTo: 'Jaipur', distanceInKm: 1280),
  ];

  static List<BusSchedule> tableSchedule = [
    BusSchedule(scheduleId: 1, bus: tableBus[0], busRoute: tableRoute[1], departureTime: '10:00', ticketPrice: 1220,),
    BusSchedule(scheduleId: 2, bus: tableBus[1], busRoute: tableRoute[4], departureTime: '20:00', ticketPrice: 1420,),
    BusSchedule(scheduleId: 3, bus: tableBus[2], busRoute: tableRoute[3], departureTime: '02:00', ticketPrice: 1040,),
    BusSchedule(scheduleId: 4, bus: tableBus[3], busRoute: tableRoute[4], departureTime: '16:00', ticketPrice: 850,),
    BusSchedule(scheduleId: 5, bus: tableBus[4], busRoute: tableRoute[0], departureTime: '08:00', ticketPrice: 1360,),
    BusSchedule(scheduleId: 6, bus: tableBus[0], busRoute: tableRoute[2], departureTime: '06:30', ticketPrice: 950,),
    BusSchedule(scheduleId: 7, bus: tableBus[1], busRoute: tableRoute[1], departureTime: '14:00', ticketPrice: 1100,),
    BusSchedule(scheduleId: 8, bus: tableBus[2], busRoute: tableRoute[4], departureTime: '09:00', ticketPrice: 1250,),
    BusSchedule(scheduleId: 9, bus: tableBus[3], busRoute: tableRoute[0], departureTime: '18:30', ticketPrice: 1500,),
    BusSchedule(scheduleId: 10, bus: tableBus[4], busRoute: tableRoute[2], departureTime: '12:00', ticketPrice: 800,),
    BusSchedule(scheduleId: 11, bus: tableBus[0], busRoute: tableRoute[3], departureTime: '22:00', ticketPrice: 1180,),
    BusSchedule(scheduleId: 12, bus: tableBus[0], busRoute: tableRoute[4], departureTime: '07:00', ticketPrice: 900,),
    BusSchedule(scheduleId: 13, bus: tableBus[2], busRoute: tableRoute[1], departureTime: '17:30', ticketPrice: 1350,),
    BusSchedule(scheduleId: 14, bus: tableBus[3], busRoute: tableRoute[2], departureTime: '11:00', ticketPrice: 1020,),
    BusSchedule(scheduleId: 15, bus: tableBus[4], busRoute: tableRoute[3], departureTime: '19:00', ticketPrice: 1200,),
  ];
  static List<BusReservation> tableReservation = [];
}