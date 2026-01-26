import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_frontend/providers/app_data_provider.dart';
import 'package:flutter_frontend/utils/constants.dart';
import 'package:flutter_frontend/utils/helper_functions.dart';
import 'package:provider/provider.dart';
=======
import 'bus_list_page.dart';
>>>>>>> bf99582 (first commit)

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
<<<<<<< HEAD

  String? fromCity, toCity;
  DateTime? departureDate;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color.fromARGB(255, 239, 238, 238),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: [
              DropdownButtonFormField<String>(
                initialValue: fromCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.black),
                ),
                hint: const Text('From'),
                isExpanded: true,
                items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                )).toList(),
                onChanged: (value) {
                  fromCity = value;
                }
              ),

              const SizedBox(height: 16.0),

              DropdownButtonFormField<String>(
                initialValue: toCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.black),
                ),
                hint: const Text('To'),
                isExpanded: true,
                items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                )).toList(),
                onChanged: (value) {
                  toCity = value;
                }
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _selectDate,
                    child: const Text('Select Departure Date')
                  ),
                  Text(
                    departureDate == null ? 'No date chosen' : getFormattedDate(departureDate!, pattern: 'EEE, dd MMM yyyy'),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),
              
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _search();
                    },
                    child: const Text('Search Buses'),
                  ),
                ),
              ),
            ],
          ),
=======
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _selectedDate;

  final List<String> _cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Pune',
    'Kolkata',
    'Ahmedabad',
    'Jaipur',
    'Lucknow',
  ];

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showCityPicker(
    BuildContext context,
    bool isFromCity,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isFromCity ? 'Select From City' : 'Select To City'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _cities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_cities[index]),
                  onTap: () {
                    setState(() {
                      if (isFromCity) {
                        _fromController.text = _cities[index];
                      } else {
                        _toController.text = _cities[index];
                      }
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _searchBuses() {
    if (_fromController.text.isEmpty ||
        _toController.text.isEmpty ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_fromController.text == _toController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('From and To cities must be different'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusListPage(
          from: _fromController.text,
          to: _toController.text,
          date: _selectedDate!,
>>>>>>> bf99582 (first commit)
        ),
      ),
    );
  }

<<<<<<< HEAD
  void _selectDate() async{
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  }

  void _search() {
    if (departureDate == null) {
      showMsg(context, emptyDateErrMessage);
      return;
    }

    if(_formKey.currentState!.validate()) {
      Provider.of<AppDataProvider>(context, listen: false)
        .getRouteByCityFromAndCityTo(fromCity!, toCity!)
        .then((route){
          Navigator.pushNamed(
            context, 
            routeNameSearchResultPage,
            arguments: [route, getFormattedDate(departureDate!, pattern: 'EEE, dd MMM yyyy')]
          );
        });
    }
  }

} 
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Reservation'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Find Your Bus',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Search and book your bus tickets easily',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                // From City
                Text(
                  'From',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _fromController,
                  readOnly: true,
                  onTap: () => _showCityPicker(context, true),
                  decoration: InputDecoration(
                    hintText: 'Select departure city',
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 25),
                // To City
                Text(
                  'To',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _toController,
                  readOnly: true,
                  onTap: () => _showCityPicker(context, false),
                  decoration: InputDecoration(
                    hintText: 'Select destination city',
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 25),
                // Date Selection
                Text(
                  'Date',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 12),
                        Text(
                          _selectedDate == null
                              ? 'Select date'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Search Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _searchBuses,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Search Buses',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
>>>>>>> bf99582 (first commit)
