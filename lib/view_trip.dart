import 'package:flutter/material.dart';
import 'package:soda_project_practice/home_page.dart';
import 'trip.dart';

class ViewTripPage extends StatelessWidget {
  final Trip trip;

  const ViewTripPage({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.name),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (constext) => MyHomePage()));
              },
              child: const Text('go to home'))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Restaurants:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedRestaurants.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedRestaurants[index]),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Cafes:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedCafes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedCafes[index]),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Entertainment:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedEntertainment.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedEntertainment[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}