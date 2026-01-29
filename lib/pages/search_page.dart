import 'package:flutter/material.dart';
import 'package:flutter_frontend/providers/app_data_provider.dart';
import 'package:flutter_frontend/utils/constants.dart';
import 'package:flutter_frontend/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
        ),
      ),
    );
  }

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
